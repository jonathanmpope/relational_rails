
class LessonsController < ApplicationController

        def index 
            @lessons = Lesson.show_true 
        end 

        def show 
            @lesson = Lesson.find(params[:id])
        end 

        def edit 
            @lesson = Lesson.find(params[:lesson_id])
        end 

        def update
            lesson = Lesson.find(params[:lesson_id])
            lesson.update(name: params[:name], format: params[:format], questions: params[:questions], complete: false)
            redirect_to "/lessons/#{lesson.id}"
        end 

        def destroy
            lesson = Lesson.find(params[:id])
            lesson.destroy  
            redirect_to '/lessons'
        end
end 