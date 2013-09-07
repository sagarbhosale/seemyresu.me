class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.string :resume_id
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
