class UsersController < ApplicationController
	def show
		if current_user
    		@user = current_user
    		@links = current_user.links.order("created_at DESC")
    		@title = "Your Page - "
    	else
    		flash[:danger] = "You need to be logged in to see that page!"
    		redirect_to login_path
    	end
  	end

  	def new
    	@user = User.new
      @title = "Sign Up - "
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


    def api_auth
      
      if params[:key] != Rails.application.secrets.api_key
        render :json => "no"
        return
      end
      user = login(params[:email], params[:password], false)
      if user 
        # Login succeeded
        logout
        render :json => "ok"
      else
        # Login Failed
        render :json => "no"
      end
    end
    def api_show 
      if params[:key] != Rails.application.secrets.api_key
        render :json => "no"
        return
      end
      user = User.find_by_email(params[:email])
      render :json => user.links.order("created_at DESC")
    end

    def api_new
      @user = User.new(permitted_params)
      if params[:key] != Rails.application.secrets.api_key
        render :json => "no"
        return
      end
      if @user.save 
        render :json => "ok"
      else
        render :json => "no"
      end
    end 


private
  	def permitted_params
    	params.require(:user).permit(:email,
        	                         :password)
  	end
end
