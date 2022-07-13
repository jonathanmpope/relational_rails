require 'rails_helper'

RSpec.describe 'lesson index page', type: :feature do 
    it 'can show the lesson name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit '/lessons'

        expect(page).to have_content(lesson1.name)
        expect(page).to have_content("Name: #{lesson1.name}")
    end 

    it 'can show the format' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit '/lessons'

        expect(page).to have_content(lesson1.format)
        expect(page).to have_content("Format: #{lesson1.format}")
    end 

    it 'can show the number of questions' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit '/lessons'

        expect(page).to have_content(lesson1.questions)
        expect(page).to have_content("Questions: #{lesson1.questions}")
    end 

    it 'can show if the lesson has been completed' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit '/lessons'

        expect(page).to have_content("Completed: yes")
    end 

    it 'has a link to the lessons index page' do 
        visit '/lessons'
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end 

    it 'has a link to the courses index page' do 
        visit '/lessons'
        click_link('Courses')

        expect(current_path).to eq('/courses')
    end 

    it 'has a link to update each lesson' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true) 
        
        visit '/lessons'
        click_button("Update #{lesson1.name}")

        expect(current_path).to eq("/lessons/#{lesson1.id}/edit")
    end 

    it 'has a link to delete each lesson' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true) 
        
        visit '/lessons'
        click_button("Delete #{lesson1.name}")

        expect(current_path).to eq("/lessons")
        expect(page).to_not have_content("Thinking about thinking")
    end 
end 