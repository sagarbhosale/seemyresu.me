class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :user_id
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
