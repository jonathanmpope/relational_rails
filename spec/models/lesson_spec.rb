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

    describe 'instance methods' do 
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
    end 

end 
