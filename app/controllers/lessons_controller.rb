
class LessonsController < ApplicationController

        def index 
            @lessons = Lesson.all 
        end 

        def show 
            @lesson = Lesson.find(params[:id])
        end 

        def edit 
        end 
end 