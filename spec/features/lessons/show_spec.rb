# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require 'rails_helper'

RSpec.describe 'lessons show page' do 
    it 'shows the lesson name' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"
        save_and_open_page

        expect(page).to have_content(lesson1.name)
        expect(page).to have_content("Name: #{lesson1.name}")
    end 

end 