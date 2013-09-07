class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :resume_id
      t.string :skill_category_id
      t.string :name

      t.timestamps
    end
  end
end
