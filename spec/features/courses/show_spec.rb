# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

require 'rails_helper'

RSpec.describe 'Show page' do
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
end 