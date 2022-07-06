
class LessonsController < ApplicationController

        def index 
            @lessons = Lesson.all 
            # binding.pry 
        end 

end 