require 'rails_helper'

RSpec.describe 'the courses show page' , type: :model do 
    describe 'instance methods' do
        describe '#count' do

            it 'should returnt the number of lessons' do 
                course1 = Course.create!(name: "Basics", participants: 20, complete: false)
                lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
                lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
                lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
                lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
                
                expect(course1.count).to eq(4)
            end 
        end 
    end 
end 