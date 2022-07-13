require 'rails_helper'

RSpec.describe Lesson, type: :model do 
    describe 'relationships' do 
        it { should belong_to :course }
    end 

    describe 'validations' do
        it { should validate_presence_of :name}
        it { should validate_presence_of :format}
        it { should validate_presence_of :questions}
        it { should  allow_value(true).for(:complete)}
    end 

    describe 'class methods' do 
        describe '#self.show_true' do
            it 'will only show true lessons' do 
                course1 = Course.create!(name: "Basics", participants: 20, complete: true)
                course1.lessons.create!(name:"Thinking about Thinking", format:"text", questions:3, complete: false)
                course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
                course1.lessons.create!(name:"Trying is Lying", format:"text", questions:2, complete: false)
                course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
                course1.lessons.create!(name:"The Second Fear", format:"audio", questions:5, complete: true)

                expect(Lesson.show_true.first.name).to eq("Attention")
                expect(Lesson.show_true.last.name).to eq("The Second Fear")
            end 
         end
         
        describe '#self.alphabet_order' do
            it 'should return the lessons in alphabetical order' do 
                course1 = Course.create!(name: "Basics", participants: 20, complete: false)
                lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
                lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
                lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
                lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
                
                expect(Lesson.alphabet_order.first).to eq(lesson2)
            end 
        end 

        describe '#self.questions' do
            it 'should return only lessons equal to or above the query' do 
                course1 = Course.create!(name: "Basics", participants: 20, complete: false)
                lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
                lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
                lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
                lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
                
                expect(Lesson.questions(3).length).to eq(2)
            end 
        end 
    end 
end 
