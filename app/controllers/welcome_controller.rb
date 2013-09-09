class WelcomeController < ApplicationController

	def index
		@testimonials = Testimonial.all
	end
end
