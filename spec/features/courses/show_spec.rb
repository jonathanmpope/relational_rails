# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'Show page', type: :feature do
    it 'will show a single course name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content(course1.name)
    end 

    it 'will show a single course participants' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content(course1.participants)
        expect(page).to have_content("Participants: #{course1.participants}")
    end 

    it 'will show a single course participants' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content("Completed: no")
    end 

    it 'should returnt the number of lessons' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content("Number of lessons: #{course1.count}")
    end 

    it 'has a link to the lessons index page' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}"
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end 
end 