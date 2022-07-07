# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course1 = Course.create!(name: "Basics", participants: 20, complete: true)
course2 = Course.create!(name: "Attention", participants: 12, complete: false)

course1.lessons.create!(name:"Thinking about Thinking", format:"text", questions:3, complete: true)
course1.lessons.create!(name:"Attention", format:"text", questions:3, complete: true)
course1.lessons.create!(name:"Trying is Lying", format:"text", questions:2, complete: false)
course1.lessons.create!(name:"Quit tomorrow", format:"video", questions:1, complete: false)
course1.lessons.create!(name:"The Second Fear", format:"audio", questions:5, complete: false)

course2.lessons.create!(name:"It's not about you", format:"audio", questions:1, complete: true)
course2.lessons.create!(name:"Contrast Drives Meaning", format:"text", questions:2, complete: false)
course2.lessons.create!(name:"The Voltage You Can Carry", format:"video", questions:4, complete: false)
course2.lessons.create!(name:"Suffer Patiently", format:"text", questions:2, complete: true)
course2.lessons.create!(name:"Quitting is an Impulse", format:"audio", questions:3, complete: false)