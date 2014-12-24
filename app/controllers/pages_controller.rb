class PagesController < ApplicationController
   
   def index 
       @body = "home"
       count = Article.count
       @count = [500, count].min
       @title = "Home - "
   end
   def about
     @title = "About Cabretio - "
   end
   def relax
   		@body = "relax"
   		@title = "Chill Bro - "
   end
    
end