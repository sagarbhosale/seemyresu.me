class CreateTmpusers < ActiveRecord::Migration
  def change
    create_table :tmpusers do |t|
      t.string :email
      t.string :firstname
      t.string :code

      t.timestamps
    end
  end
end
