module ApplicationHelper
  	
  	def mobile_device?
	  if session[:mobile_param]
	    session[:mobile_param] == "1"
	  else
	    request.user_agent =~ /Mobile|webOS/
	  end
	end

	def human_num(number,rounding=0,delimiter=',',separator='.')
	    value = number.to_i.ceil

	    #see number with delimeter
	    parts = value.to_s.split('.')
	    parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
	    parts.join separator
	  end
  
end
