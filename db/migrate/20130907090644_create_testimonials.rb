class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :what
      t.string :who

      t.timestamps
    end
  end
end
