class Skill < ActiveRecord::Base
  attr_accessible :name, :user_id, :skill_category_id

  validates_presence_of :name, :message => "Skill name is missing"

  validates_presence_of :user_id, :message => "Some data is missing"

  validates_presence_of :skill_category_id, :message => "Some data is missing"

end
