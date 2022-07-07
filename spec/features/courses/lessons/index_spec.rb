# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe 'Course lesson index page' do 

    it 'has a list of lessons on the page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}/lessons"

        expect(page).to have_content(lesson1.name)
        expect(page).to have_content(lesson2.name)
        expect(page).to have_content(lesson3.name)
        expect(page).to have_content(lesson4.name)
    end 

    it 'has a list of lesson formats on the page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}/lessons"

        expect(page).to have_content(lesson1.format)
        expect(page).to have_content(lesson2.format)
        expect(page).to have_content(lesson3.format)
        expect(page).to have_content(lesson4.format)
    end 

    it 'has a list of the number of lesson questions on the page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}/lessons"

        expect(page).to have_content(lesson1.questions)
        expect(page).to have_content(lesson2.questions)
        expect(page).to have_content(lesson3.questions)
        expect(page).to have_content(lesson4.questions)
    end 

    it 'indicates if the lesson has been completed on the page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}/lessons"

        expect(page).to have_content("Completed: yes")
        expect(page).to have_content("Completed: no")
    end 

    it 'has a link to the lessons index page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}/lessons"
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end 

    it 'has a link to the courses index page' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}/lessons"
        click_link('Courses')

        expect(current_path).to eq('/courses')
    end 
end 