class ArticlesController < ApplicationController

	def index
		if params[:page]
			page = params[:page]	
		else 
			page = 1
		end
    # @articles = Article.order("RANDOM()").paginate(:page => page, :per_page => 15)
    @articles = Article.order(:cached_votes_score => :desc).paginate(:page => page, :per_page => 15)
		@page = page
		@title = "Articles - "
	end

	def show
		@article = Article.find(params[:id])
		@title = @article.title
	end
	
	def search
		if params[:page]
			@page = params[:page]	
  		@title = "Search Results - "
		else 
			@page = 1
      @title = "Search - "
		end
		@articles = Article.search(params[:search]).paginate(:page => @page, :per_page => 15).uniq
		@count = @articles.count
	end
  
  def random 
    @art = Article.order("RANDOM()").first
    redirect_to article_path(@art)
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
	
end