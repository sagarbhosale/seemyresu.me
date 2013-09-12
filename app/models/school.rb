class School < ActiveRecord::Base
  attr_accessible :desc, :from, :name, :user_id, :to, :website

  belongs_to :user
end
