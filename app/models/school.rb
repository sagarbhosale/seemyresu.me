class School < ActiveRecord::Base
  attr_accessible :desc, :from, :name, :user_id, :to, :website

  validates_presence_of :desc, :message => "Degree is missing"

  validates_presence_of :name, :message => "Name required"

  validates_format_of :website, :with => /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[.\!\/\\w]*))?)/i, :message => "Invalid URL"

  belongs_to :user
end
