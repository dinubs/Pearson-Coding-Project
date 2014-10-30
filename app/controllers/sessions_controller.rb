class SessionsController < ApplicationController

    def new  
      @title = "Login - "
  	end  
    
  	def create  
    	user = login(params[:email], params[:password],	params[:remember_me])  
    	if user  
      		redirect_back_or_to me_path, :success => "Logged in!"  
    	else  
      		flash[:danger] = "Email or password was invalid."  
          redirect_to :back
		end  
	end  

	def destroy  
  		logout  
  		redirect_to root_url, :success => "Logged out!"  
	end 

end