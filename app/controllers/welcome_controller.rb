class WelcomeController < ApplicationController

	def index
		if (session[:user_id])
			redirect_to "/profile"
		else
			@testimonials = Testimonial.all
		end
	end
end
