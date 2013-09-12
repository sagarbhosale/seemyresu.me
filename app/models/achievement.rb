class Achievement < ActiveRecord::Base
  attr_accessible :description, :user_id, :year

  belongs_to :user
end
