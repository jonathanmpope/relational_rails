class Course < ApplicationRecord
    has_many :lessons
    validates_presence_of :name

    def count 
        self.lessons.count
    end 
end 