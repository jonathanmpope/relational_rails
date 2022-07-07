require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "Courses index page", type: :feature do 
    let(:coursename1) { "<p>Name: Basics</p>" }
    let(:coursename2) { "<p>Name: Listening</p>" }

    it 'can see the name of each course in the system' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses'

        expect(page).to have_content(course1.name)
        expect(page).to have_content("Name: #{course2.name}")
    end 

    it 'can see the number of participants each course has' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses'

        expect(page).to have_content(course1.participants)
        expect(page).to have_content("Participants: #{course2.participants}")
    end 

    it 'can see if course has been completed' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses'

        expect(page).to have_content("Completed: yes")
        expect(page).to have_content("Completed: no")
    end 

    it 'sorts the index page by most recently created' do 
        
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses'

        expect(coursename1).to appear_before(coursename2)     
    end 

    it 'can show when each course was created' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses'

        expect(page).to have_content("Created: #{course1.created_at}")
        expect(page).to have_content("Created: #{course2.created_at}")
    end 

    it 'has a link to the lessons index page' do 
        visit '/courses'
        save_and_open_page
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end 


end 