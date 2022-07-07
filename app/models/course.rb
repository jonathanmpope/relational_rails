class Course < ApplicationRecord
    has_many :lessons
    validates_presence_of :name
    validates_presence_of :participants
    validates :complete, inclusion: [true, false]

    def lesson_count 
        self.lessons.count
    end 

    # def course_order
    #     binding.pry  
    # end
end 