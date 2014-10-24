class ArticlesController < ApplicationController

	def index
		if params[:page]
			page = params[:page]	
		else 
			page = 1
		end
		@articles = Article.paginate(:page => page, :per_page => 15)
		@page = page
		@title = "Articles - "
	end

	def show
		@article = Article.find_by_articleId(params[:id])
		@title = @article.title
	end
	
	def search
		if params[:page]
			@page = params[:page]	
		else 
			@page = 1
		end
		@title = "Search Results - "
		@articles = Article.search(params[:search]).paginate(:page => @page, :per_page => 15)	
		@count = @articles.count
	end
	
end