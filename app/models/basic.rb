class Basic < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :mobile, :resume_id

  belongs_to :resume
end
