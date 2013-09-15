module Api
  module V1
    class PeoplesController < ApplicationController
      respond_to :xml

      def index
        users = User.select { |i| i[:firstname].to_s + i[:lastname].to_s == params[:name] }
  		  respond_to do |format|
          format.xml { render :text => users.to_xml(skip_instruct: true, only: [:firstname, :lastname, :email, :skills]) }
        end
      end

    end
  end
end