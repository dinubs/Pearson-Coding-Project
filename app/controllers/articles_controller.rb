class ArticlesController < ApplicationController

	def index
		@page = params[:page]
		@articles = Article.paginate(:page => @page, :per_page => 15)
		@title = "Articles - "
	end

	def show
		@article = Article.find(params[:id])
		@title = @article.title
	end

end