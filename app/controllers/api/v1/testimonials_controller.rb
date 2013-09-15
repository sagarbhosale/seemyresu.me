module Api
  module V1
    class TestimonialsController < ApplicationController
      respond_to :xml

      # GET /skills
      # GET /skills.json
      def index
        render xml: Testimonial.all
      end

    end
  end
end