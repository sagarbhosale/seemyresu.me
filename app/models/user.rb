class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password_hash, :views, :mobile, :resume_template, :sharing

  validates_presence_of :email, :message => "Email required"

  validates_presence_of :firstname, :message => "First name required"

  validates_presence_of :password_hash, :message => "Password required"

  validates_numericality_of :views, :message => "Some data required"

  validates_uniqueness_of :email, :message => "Email already exists"

  validates_numericality_of :resume_template, :greater_than => 0

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invalid email"

  has_many :experiences
  has_many :schools
  has_many :skills
  has_many :achievements

end
