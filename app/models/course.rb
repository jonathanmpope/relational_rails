class Course < ApplicationRecord
    has_many :lessons
    validates_presence_of :name
    validates_presence_of :participants
    validates :complete, inclusion: [true, false]

    def lesson_count 
        self.lessons.count
    end 

    def self.course_order
        order(created_at: :desc)
    end

    def self.sort_by_num_lessons
        left_outer_joins(:lessons).group(:id).order(Arel.sql('COUNT(courses.id) DESC'))   
    end 

    def self.contain_word(word)
        where("name LIKE ?", "%#{word}%")
    end
end 