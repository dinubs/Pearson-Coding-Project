class LinksController < ApplicationController
  protect_from_forgery :except => [:delete]
	def new
		if !current_user
			flash[:warning] = "You need to <b>#{ActionController::Base.helpers.link_to "login", login_path}</b> or <b>#{ActionController::Base.helpers.link_to "sign up", signup_path}</b> first".html_safe
      session[:return_to_url] = request.original_url
			redirect_to login_path 
		end
		@link = Link.new
    @title = "New Link - "
	end
	def create
  	@user = current_user
  	@link = @user.links.new(permitted_params)
    @link.article_title = @link.article_title.strip
    @link.website_title = @link.website_title.strip
  	@link.user = current_user
  	if @link.save
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
        @title = "Edit #{@link.article_title} - "
  		rescue ActiveRecord::RecordNotFound
    		flash[:danger] = "That link doesn't exist!"
    		redirect_to root_path
  		end
  	end  
  	def update  
    	@link = Link.find(params[:id])  
    	if @link.update_attributes(permitted_params)  
      		flash[:success] = "Link: #{@link.article_title} has been successfully updated!"   
          redirect_to me_path         
      else
        redirect_to :back
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