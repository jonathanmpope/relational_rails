require 'rails_helper'

RSpec.describe "Course Lessons new page", type: :feature do 
    it 'creates a new lesson for a course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}/lessons/new"
        fill_in("Name", with:"Perception")
        fill_in("Format", with:"text")
        fill_in("Questions", with:2)
        click_button("Create Lesson")
        
        expect(current_path).to eq("/courses/#{course1.id}/lessons")
        expect(page).to have_content("Perception")
    end 

    it 'cannot create a new lesson for a course without a name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}/lessons/new"
        fill_in("Name", with:"Perception")
        fill_in("Format", with:"text")
        click_button("Create Lesson")
        save_and_open_page
        
        expect(page).to_not have_content("Perception")
    end 
end 