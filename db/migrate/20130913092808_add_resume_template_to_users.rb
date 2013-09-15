class AddResumeTemplateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :resume_template, :integer
  end
end
