class Lesson < ApplicationRecord
    belongs_to :course
    validates_presence_of :name
    validates_presence_of :format
    validates_presence_of :questions
end 