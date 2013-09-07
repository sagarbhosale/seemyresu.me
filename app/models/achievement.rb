class Achievement < ActiveRecord::Base
  attr_accessible :description, :resume_id, :year

  belongs_to :resume
end
