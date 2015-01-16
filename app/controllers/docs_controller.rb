class DocsController < ApplicationController
	before_filter :require_login, :except => [:article, :link_from_article, :doc_from_page]

	respond_to :docx

	Htmltoword.configure do |config|
		config.default_xslt_path = "#{File.expand_path File.dirname(__FILE__)}/htmltoword/"
		config.custom_xslt_path = "#{File.expand_path File.dirname(__FILE__)}/htmltoword/style.xslt"
	end



	def template
		render docx: 'template', filename: 'my_file.docx'
	end

	def links
		if params[:links] == "all"
			@links = current_user.links
		elsif params[:article]
			article = Article.find(params[:article])
			@links = Link.first
		else
			@link = Link.find(params[:links])
		end
		render docx: 'links', filename: "Your Links.docx"
	end
	def link_from_article
		article = Article.find(params[:article])
		@link = Link.new({:article_title => article.title,
				 :website_title => "Cabretio",
				 :date_accessed => Date.today,
				 :url => "#{request.protocol}#{request.host_with_port}/#{article.id}" })
		render docx: 'links', filename: "Your Links.docx"
	end

	def link_from_cat
		puts params[:links]
		@links = current_user.links.where(category: params[:links])
		render docx: 'links', filename: "Your Links.docx"
	end

	def article
		@article = Article.find(params[:article].to_i)
		render docx: 'article', filename: "#{@article.title}.docx"
	end
	
	def doc_from_page
	  begin  
      page = Nokogiri::HTML(open(params[:page]))
      source = open(params[:page]).read
    rescue => e
      return
    end
    content = Readability::Document.new(source).content
    pTags = Nokogiri::HTML(content).css("p")
    title = page.css("h1")[0].text.strip
    tags = []
    pTags.each do |tag| 
      tags.push(tag.text.strip)
    end
    @article = Article.new
    @article.title = title
    @article.content = tags
    @article.link = params[:page]
	  render docx: 'article', filename: "#{@article.title}.docx"
	end

private 

end