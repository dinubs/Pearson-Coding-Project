class PagesController < ApplicationController
   
   def index 
       @body = "home"
       @count = Article.count
       @node_count = [500, @count].min
       @title = "Home - "
   end
   def about
     @title = "About Cabretio - "
     @ft_count = Article.from_ft
     @count = Article.count
   end
   def relax
   		@body = "relax"
   		@title = "Chill Bro - "
   end
    
end