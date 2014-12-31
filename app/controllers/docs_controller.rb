class DocsController < ApplicationController
	before_filter :require_login

	respond_to :docx

	Htmltoword.configure do |config|
		# config.default_xslt_path = "#{File.expand_path File.dirname(__FILE__)}/htmltoword/"
		# config.custom_xslt_path = "#{File.expand_path File.dirname(__FILE__)}/htmltoword/html_to_wordml.xslt"
	end



	def template
		render docx: 'template', filename: 'my_file.docx'
	end

	def links
		if params[:links] == "all"
			@links = current_user.links
		else
			@links = Link.find(params[:links].to_i)
		end
		render docx: 'links', filename: "Your Links.docx"
	end

	def article
		@article = Article.find(params[:article].to_i)
		render docx: 'article', filename: "#{@article.title}.docx"
	end

private 

end