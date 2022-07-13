require 'rails_helper'

RSpec.describe "Courses index page", type: :feature do 
    let(:coursename1) { "Basics" }
    let(:coursename2) { "Listening" }

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

        expect(coursename2).to appear_before(coursename1)     
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
        click_link('Lessons')

        expect(current_path).to eq('/lessons')
    end
    
    it 'has a link to the courses index page' do 
        visit '/courses'
        click_link('Courses')

        expect(current_path).to eq('/courses')
    end 

     it 'has a link to create a new course' do 
        visit '/courses'        
        click_button('New Course')

        expect(current_path).to eq('/courses/new')
    end 

    it 'has a link to update each course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)

        visit '/courses'        
        click_button('Update Basics')

        expect(current_path).to eq("/courses/#{course1.id}/edit")
    end 

    it 'has a link to delete each course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)

        visit '/courses'        
        click_button('Delete Basics')

        expect(current_path).to eq("/courses")
        expect(page).to_not have_content("Basics")
    end 

    it 'has a link to sort by number of lessons in each course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course2.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course2.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course2.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit '/courses'        
        click_link('Sort Courses By Number of Lessons')

        expect(current_path).to eq("/courses")
        expect(coursename2).to appear_before(coursename1)     
    end 

     it 'shows the number of lessons next to each course' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)
        lesson2 = course2.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
        lesson3 = course2.lessons.create!(name:"Trying is lying", format:"text", questions:2, complete: false)
        lesson4 = course2.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)

        visit '/courses'        

        expect(page).to have_content("Number of lessons: 1")   
        expect(page).to have_content("Number of lessons: 3")   
    end 

    it 'can do a partial course name search' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: true)
        course2 = Course.create!(name: "Listening", participants: 12, complete: false)

        visit '/courses' 
        fill_in("search", with:"asic")
        click_button("Search")

        expect(page).to have_content("Basics")   
        expect(page).to_not have_content("Listening")   
    end 
end 