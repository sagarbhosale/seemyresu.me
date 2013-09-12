class SkillCategory < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name, :message => "Skill category name is missing"

  has_many :skills
end