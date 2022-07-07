# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require 'rails_helper'

RSpec.describe 'lessons show page' do 
    it 'shows the lesson name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"

        expect(page).to have_content(lesson1.name)
        expect(page).to have_content("Name: #{lesson1.name}")
    end 

    it 'shows the lesson format' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"

        expect(page).to have_content(lesson1.format)
        expect(page).to have_content("Format: #{lesson1.format}")
    end 

    it 'shows the number of lessons', type: :feature do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"

        expect(page).to have_content(lesson1.questions)
        expect(page).to have_content("Questions: #{lesson1.questions}")
    end 

    it 'shows if the lesson has been completed' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"

        expect(page).to have_content("Completed: yes")
    end

    it 'has a link to the lessons index page' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end
end 