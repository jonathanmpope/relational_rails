class Course < ApplicationRecord
    has_many :lessons
    validates_presence_of :name
    validates_presence_of :participants

    def count 
        self.lessons.count
    end 
end 