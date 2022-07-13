require 'rails_helper'

RSpec.describe "Courses new page", type: :feature do 
    it 'creates a new course' do 
        visit '/courses/new' 

        fill_in("Name", with:"Stress 101")
        fill_in("Participants", with:5)
        choose(id="complete_true")
        click_button("Create Course")

        expect(current_path).to eq("/courses")
        expect(page).to have_content("Stress 101")
        expect(page).to have_content("Participants: 5")
    end 

    it 'will not create a new course without choosing if it has been completed' do 
        visit '/courses/new'

        fill_in("Name", with:"Stress 101")
        fill_in("Participants", with:5)
        click_button("Create Course")
        
        visit '/courses'

        expect(page).to_not have_content("Stress 101")
        expect(page).to_not have_content("Participants: 5")
    end 
end 