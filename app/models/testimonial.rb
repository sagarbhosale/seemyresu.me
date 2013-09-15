class Testimonial < ActiveRecord::Base
  attr_accessible :what, :who

  validates_presence_of :what, :message => "Please provide a body for the Testimonial"

  validates_presence_of :who, :message => "Please provide an author for the Testimonial"
end
