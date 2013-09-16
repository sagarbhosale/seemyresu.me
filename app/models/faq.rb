class Faq < ActiveRecord::Base
  attr_accessible :answer, :question

  validates_presence_of :question, :message => "We need a question"

  validates_presence_of :answer, :message => "We need an answer"

end
