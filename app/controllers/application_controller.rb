class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

 	def human_num(number,rounding=0,delimiter=',',separator='.')
      value = number.to_i.ceil
  
      #see number with delimeter
      parts = value.to_s.split('.')
      parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
      parts.join separator
    end
    def citation (article_title, website_title, date, url)
  	 "\"#{article_title}\". #{website_title}. Web. #{date.strftime('%B')}, #{date.year} <#{url}>"
    end

    helper_method :human_num
    helper_method :citation
    
end
