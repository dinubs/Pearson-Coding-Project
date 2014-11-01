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
	
end