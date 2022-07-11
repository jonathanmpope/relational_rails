require 'rails_helper'

RSpec.describe "Courses edit page", type: :feature do 
    it 'edits a course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)

        visit "/courses/#{course1.id}"

        expect(page).to have_content("Basics")
        expect(page).to have_content("Participants: 20")
        expect(page).to have_content("Completed: no")

        visit "/courses/#{course1.id}/edit"

        fill_in("Name", with:"Basics 101")
        fill_in("Participants", with:15)
        choose(id="complete_false")
        click_button("Update Course")
        
        expect(current_path).to eq("/courses/#{course1.id}")
        expect(page).to have_content("Basics 101")
        expect(page).to have_content("Participants: 15")
    end 
end 