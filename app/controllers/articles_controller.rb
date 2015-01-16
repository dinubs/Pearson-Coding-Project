class ArticlesController < ApplicationController

	def index
		if params[:page]
			page = params[:page]	
		else 
			page = 1
		end
    if params[:per_page] 
      per_page = params[:per_page]
    else
      per_page = 15
    end
    @articles = Article.order(:cached_votes_score => :desc).paginate(:page => page, :per_page => per_page)
		@page = page
		@title = "Articles - "
    respond_to do |format|
      format.json  { render :json => @articles } # don't do msg.to_json
      format.html 
    end
	end

	def show
		@article = Article.find(params[:id])
		@title = @article.title
    @link = Link.new()
    @link.article_title = @article.title
    if @article.link.scan(/\/([^"]*)\./)[0][0].include? "www."
      @link.website_title = "Cabretio"
    else
      @link.website_title = @article.link.scan(/\/([^"]*)\./)[0][0]
    end
    @link.url = "#{request.protocol}#{request.host_with_port}/#{@article.id}"
    respond_to do |format|
      format.json  { render :json => @article } # don't do msg.to_json
      format.html 
    end
	end
	
	def search
		if params[:page]
			@page = params[:page]	
  		@title = "Search Results - "
		else 
			@page = 1
      @title = "Search - "
		end
    if params[:per_page] 
      per_page = params[:per_page]
    else
      per_page = 15
    end
		@articles = Article.search(params[:search]).paginate(:page => @page, :per_page => per_page)
		@count = @articles.count
    respond_to do |format|
      format.json  { render :json => @articles } # don't do msg.to_json
      format.html 
    end
	end
  
  def random 
    @art = Article.order("RANDOM()").first
    redirect_to article_path(@art)
  end

  require 'open-uri'
  def create
    if !current_user
      flash[:danger] = "HEY! You need to be signed in to do that"
      redirect_to login_path
      return
    end
    begin  
      page = Nokogiri::HTML(open(permitted_params))
      source = open(permitted_params).read
    rescue => e
      flash[:danger] = "HEY! That's not a real url"
      redirect_to root_path
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
    @article.link = permitted_params
    # if params[:create_link] == "1"
    #   puts "YES"
    #   @user = current_user
    #   link = @article.link.scan(/\.([^"]*)\./)
    #   if link.empty?
    #     link = @article.link.scan(/\/([^"]*)\./)
    #   end
    #   puts link.count
    #   @link = @user.links.new(:website_title => link[0][0],
    #                           :article_title => @article.title,
    #                           :date_accessed => DateTime.now(),
    #                           :user => @user,
    #                           :url => @article.link)
    #   if @link.save!
    #     flash[:info] = "psst, we also added this to your links :)"
    #   end
    # end
    if @article.save
      flash[:success] = "Awesome, you've created a new article!"
      redirect_to article_path(@article)
    end
  end
  
  def randomize
		if params[:page]
			page = params[:page]	
		else 
			page = 1
		end
    @articles = Article.order("RANDOM()").paginate(:page => page, :per_page => 15)
		@page = page
		@title = "Articles - "
  end

  def vote
    @article = Article.find(params[:id])
    if !current_user
      flash[:danger] = "You need to be logged in to like a post"
      session[:return_to_url] = like_article_path(@article)
      redirect_to login_path
    elsif current_user.voted_up_on? @article
      flash[:warning] = "You've already liked this article, try to like another one"
      redirect_to article_path(@article)
    elsif @article.liked_by current_user
      flash[:success] = "You liked this article"
      redirect_to article_path(@article)
    end
  end

  def downvote
    @article = Article.find(params[:id])
    if !current_user
      flash[:danger] = "You need to be logged in to like a post"
      session[:return_to_url] = dislike_article_path(@article)
      redirect_to login_path
    elsif current_user.voted_down_on? @article
      flash[:warning] = "You've already liked this article, try to like another one"
      redirect_to article_path(@article)
    elsif @article.disliked_by current_user
      flash[:success] = "You disliked this article"
      redirect_to article_path(@article)
    end
  end	

  private
    def permitted_params
      params.require(:link)
    end
end