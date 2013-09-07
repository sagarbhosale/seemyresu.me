class Experience < ActiveRecord::Base
  attr_accessible :desc, :from, :name, :resume_id, :to, :website

  belongs_to :resume
end
