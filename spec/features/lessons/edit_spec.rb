require 'rails_helper'

RSpec.describe 'lesson edit page', type: :feature do 
    it 'can edit the lesson info' do 
        course1 = Course.create!(name: "Basics", participants: 20, complete: false)
        lesson1 = course1.lessons.create!(name:"Thinking about thinking", format:"text", questions:3, complete: true)

        visit "/lessons/#{lesson1.id}"

        expect(page).to have_content(lesson1.name)

        visit "/lessons/#{lesson1.id}/edit"

        fill_in("Name", with:"Thinking about nothing")
        fill_in("Format", with:"text")
        fill_in("Questions", with:2)
        choose(id="complete_true")
        click_button("Update Lesson")

        expect(current_path).to eq("/lessons/#{lesson1.id}")
        expect(page).to have_content("Thinking about nothing")
    end 
end 