class Feedback < ActiveRecord::Base
  attr_accessible :description, :who

  validates_presence_of :description, :message => "Description missing"

  validates_presence_of :who, :message => "Please enter your name"

  validates_format_of :who, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invalid email"

end
