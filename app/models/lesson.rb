class Lesson < ActiveRecord::Base
  belongs_to :lesson_module
  has_many :tests
  accepts_nested_attributes_for :tests

  has_many :lesson_progresses
end
