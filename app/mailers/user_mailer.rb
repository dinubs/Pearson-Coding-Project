class UserMailer < ApplicationMailer
  	default from: "Gavin at Cabretio <cabretio@cabret.io>"

  	def welcome_email(user)
	  	@user = user
	  	@count = Article.count
	  	@articles = Article.order("RANDOM()").limit(5)
  		mail to: @user.email, subject: "Welcome to Cabretio!"
	end
end
