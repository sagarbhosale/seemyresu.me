class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.integer :likes
      t.integer :views

      t.timestamps
    end
  end
end
