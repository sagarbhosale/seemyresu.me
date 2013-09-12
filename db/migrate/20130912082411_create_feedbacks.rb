class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :who
      t.string :description

      t.timestamps
    end
  end
end
