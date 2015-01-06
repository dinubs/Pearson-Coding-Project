module MailerHelper
	def human_num(number,rounding=0,delimiter=',',separator='.')
	    value = number.to_i.ceil

	    #see number with delimeter
	    parts = value.to_s.split('.')
	    parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
	    parts.join separator
	  end
end

class ApplicationMailer < ActionMailer::Base
  # default "from@example.com"
  # layout 'mailer'
  helper MailerHelper
end