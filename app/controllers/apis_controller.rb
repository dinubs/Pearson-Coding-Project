class ApisController < ApplicationController
	def categories
		categories = current_user.links.select('category')
		@categories
		categories.each { |x| @categories << x.category }
		respond_to do |format|
	      format.json  { render :json => @categories } # don't do msg.to_json
	    end
	end
end
