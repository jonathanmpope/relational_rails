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

    it 'should return the number of lessons' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content("Number of lessons: #{course1.lesson_count}")
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

    it 'has a link to the courses index page' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}"
        click_link('Courses')

        expect(current_path).to eq('/courses')
    end

    it 'has a link to the course lessons page' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}"
        click_link('Course Lessons')

        expect(current_path).to eq("/courses/#{course1.id}/lessons")
    end

    it 'has a link update the course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course1.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
        
        visit "/courses/#{course1.id}"
        click_link('Update Basics')

        expect(current_path).to eq("/courses/#{course1.id}/edit")
    end

    it 'has a link to delete each course and its lessons' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)

        visit "/courses/#{course1.id}"       
        click_button('Delete Basics')

        expect(current_path).to eq("/courses")
        expect(page).to_not have_content("Basics")

        visit '/lessons'

        expect(page).to_not have_content("Thinking about thinking")
        expect(page).to_not have_content("Attention")
    end 
end 