class Resume < ActiveRecord::Base
  attr_accessible :likes, :user_id, :views

  has_one :basic
  has_many :achievements
  has_many :schools
  has_many :experiences
  has_many :skills

  def index
  end
end