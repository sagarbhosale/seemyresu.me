class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :resume_id
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
