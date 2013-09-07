class Skill < ActiveRecord::Base
  attr_accessible :name, :resume_id, :skill_category_id
end
