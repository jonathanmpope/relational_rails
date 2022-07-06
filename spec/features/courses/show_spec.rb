# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'Show page' do
    it 'will show a single course name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit "/courses/#{course1.id}"
        # save_and_open_page 

        expect(page).to have_content(course1.name)
    end 
end 