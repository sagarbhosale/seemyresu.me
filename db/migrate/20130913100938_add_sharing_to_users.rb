class AddSharingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sharing, :string
  end
end
