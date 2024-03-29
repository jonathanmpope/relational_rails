class Lesson < ApplicationRecord
    belongs_to :course
    # , dependent_destroy
    validates_presence_of :name
    validates_presence_of :format
    validates_presence_of :questions
    validates :complete, inclusion: [true, false]

    def self.show_true 
        where(complete: true)
    end 

    def self.alphabet_order
        order(name: :asc)
    end 

    def self.questions(number_string)
        num = number_string.to_i
        where("questions >= #{num}")
    end 

    def self.contain_word(word)
        where("name LIKE ?", "%#{word}%")
    end
end 