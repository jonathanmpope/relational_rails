class Course < ApplicationRecord
    has_many :lessons

    def count 
        self.lessons.count
    end 
end 