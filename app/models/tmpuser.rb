class Tmpuser < ActiveRecord::Base
  attr_accessible :code, :email, :firstname

  validates_presence_of :email, :message => "Email is missing"

  validates_presence_of :firstname, :message => "First name is missing"

  validates_presence_of :code, :message => "Some data is missing"

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invalid email"

end
