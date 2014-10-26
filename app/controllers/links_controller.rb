class LinksController < ApplicationController

	def new
		if !current_user
			flash[:warning] = "You need to login or sign up first"
			redirect_to login_path 
		end
		@link = Link.new
	end
	def create
    	@user = current_user
    	@link = @user.links.new(permitted_params)
    	@link.user = current_user
    	if @link.save
		    auto_login(@user)
		    flash[:success] = "Awesome, you've created a new link!"
		    redirect_to me_path
    	else
    		flash[:warning] = @link.errors.full_messages.to_sentence
      		render new_link_path
    	end
  	end 

  	def destroy
	    @link = Link.find(params[:id])
	    flash[:warning] = "Your link: #{@link.article_title} has been destroyed"
	    @link.destroy

	    redirect_to me_path
  	end

  	def edit  
    	begin
    		@link = Link.find(params[:id]) 
    		if @link.user != current_user
    			flash[:danger] = "You don't have access to that link!"
    			redirect_to root_path
    		end
  		rescue ActiveRecord::RecordNotFound
    		flash[:danger] = "That link doesn't exist!"
    		redirect_to root_path
  		end
  	end  
  
  	def update  
    	@link = Link.find(params[:id])  
    	if @product.update_attributes(permitted_params)  
      		flash[:success] = "Link: #{@link.article_title} has been successfully updated!"  
    	end  
  	end  
private
  	def permitted_params
    	params.require(:link).permit(:article_title,
        	          				 :website_title,
        	  		  				 :date_accessed,
        	          				 :url)
  	end

end