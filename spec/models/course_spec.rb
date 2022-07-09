require 'rails_helper'

RSpec.describe Course , type: :model do 
    describe 'relationships' do 
        it { should have_many :lessons }
    end 

    describe 'validations' do
         it { should validate_presence_of :name}
         it { should validate_presence_of :participants}
        it { should  allow_value(true).for(:complete)}
    end 

    describe 'instance methods' do
        describe '#count' do
            it 'should return the number of lessons' do 
                course1 = Course.create!(name: "Basics", participants: 20, complete: false)
                lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
                lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
                lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
                lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
                
                expect(course1.lesson_count).to eq(4)
            end 
        end 

        describe '#self.sort_by' do
            it 'sorts the index page by most recently created' do 
                course1 = Course.create!(name: "New", participants: 20, complete: true)
                course2 = Course.create!(name: "Newer", participants: 12, complete: false)

                expect(Course.course_order.first.id).to eq(course2.id)  
                expect(Course.course_order[1].id).to eq(course1.id)   
            end 
        end
    end 
end 