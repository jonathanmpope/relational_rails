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

    it 'has a link to create a new lesson' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        visit "/courses/#{course1.id}/lessons"
        
        click_link('New Lesson')

        expect(current_path).to eq("/courses/#{course1.id}/lessons/new")
    end 

    it 'has a link to sort children in alphabetical order' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        
        visit "/courses/#{course1.id}/lessons"
        click_link('Sort Lessons Alphabetically')
        
        expect(page).to have_current_path("/courses/#{course1.id}/lessons?sort=alphabet")
    end 

    it 'has a link to update each lesson' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true) 
        
        visit "/courses/#{course1.id}/lessons"
        click_button("Update #{lesson1.name}")

        expect(current_path).to eq("/lessons/#{lesson1.id}/edit")
    end 

    it 'has a form that allows you to input a number' do
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:0, complete: true)
        
        visit "/courses/#{course1.id}/lessons"
        fill_in("Number", with:2)
        click_button("Filter")

        # expect(page).to have_current_path("/courses/#{course1.id}/lessons?sort=questions")
        expect(page).to_not have_content("Attention")
        expect(page).to have_content("Thinking about thinking")

        visit "/courses/#{course1.id}/lessons"
        fill_in("Number", with:4)
        click_button("Filter")

        expect(page).to_not have_content("Attention")
        expect(page).to_not have_content("Thinking about thinking")
    end 
end 