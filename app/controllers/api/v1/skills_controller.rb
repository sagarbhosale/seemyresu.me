module Api
  module V1
    class SkillsController < ApplicationController
      respond_to :xml

      def index
        render xml: Skill.all
      end

    end
  end
end