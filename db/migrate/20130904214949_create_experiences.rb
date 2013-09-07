class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :resume_id
      t.date :from
      t.date :to
      t.string :name
      t.string :website
      t.string :desc

      t.timestamps
    end
  end
end
