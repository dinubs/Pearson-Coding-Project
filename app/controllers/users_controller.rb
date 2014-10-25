class UsersController < ApplicationController
	def show
		if current_user
    		@user = current_user
    		@links = current_user.links.order("created_at DESC")
    		@title = "Your Page - "
    	else
    		flash[:danger] = "You need to be logged in to see that page!"
    		redirect_to articles_path
    	end
  	end

  	def new
    	@user = User.new
  	end

  	def create
    	@user = User.new(permitted_params)
    	if @user.save
		    auto_login(@user)
		    flash[:success] = "Thanks for signing up!"
		    redirect_to root_path
    	else
      		render :new
    	end
  	end  
private
  	def permitted_params
    	params.require(:user).permit(:email,
        	                         :password)
  	end
end
