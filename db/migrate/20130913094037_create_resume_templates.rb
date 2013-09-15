class CreateResumeTemplates < ActiveRecord::Migration
  def change
    create_table :resume_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
