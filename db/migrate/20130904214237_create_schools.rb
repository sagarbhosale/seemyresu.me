class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :user_id
      t.date :from
      t.date :to
      t.string :name
      t.string :website
      t.string :desc

      t.timestamps
    end
  end
end
