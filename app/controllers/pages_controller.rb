class PagesController < ApplicationController
   
   def index 
       @body = "home"
       @count = Article.count
   end
   def about
   end
    
end