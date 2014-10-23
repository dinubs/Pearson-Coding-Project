class PagesController < ApplicationController
   
   def index 
       @body = "home"
       @count = Article.count
   end
   def about
   end
   def relax
   		@body = "relax"
   		@title = "Chill Bro - "
   end
    
end