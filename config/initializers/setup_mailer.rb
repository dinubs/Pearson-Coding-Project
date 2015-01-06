ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "sandbox978d92e15f0b4c28b1634225c2dbe4bb.mailgun.org",
  :user_name => "postmaster@sandbox978d92e15f0b4c28b1634225c2dbe4bb.mailgun.org",
  :password => "888136760473dd5d333fef3ada0f7d79"
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000" if Rails.env.development?
ActionMailer::Base.default_url_options[:host] = "ft-researcher.herokuapp.com" if Rails.env.production?
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?