require 'rails_helper'

RSpec.describe "Courses new page", type: :feature do 
    it 'creates a new course' do 
        visit '/courses/new'

        fill_in("Name", with:"Stress 101")
        fill_in("Name", with:"Stress 101")
        fill_in("Name", with:"Stress 101")
        fill_in("Name", with:"Stress 101")
        click_button("Create Course")
        
        expect(current_path).to eq("/artists")
        expect(page).to have_content("Stress 101")
    end 

end 