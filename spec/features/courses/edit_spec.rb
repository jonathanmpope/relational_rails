require 'rails_helper'

RSpec.describe "Courses edit page", type: :feature do 
    it 'edits a course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content("Basics")

        visit "/courses/#{course1.id}/edit"

        fill_in("Name", with:"Basics 101")
        click_button("Update Course")
        
        expect(current_path).to eq("/courses/#{course1.id}")
        expect(page).to have_content("Basics 101")
    end 
end 