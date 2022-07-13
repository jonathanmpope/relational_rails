
class LessonsController < ApplicationController

        def index 
            if params[:search] != nil 
                @lessons = Lesson.contain_word(params[:search])
            else 
                @lessons = Lesson.show_true 
            end 
        end 

        def show 
            @lesson = Lesson.find(params[:id])
        end 

        def edit 
            @lesson = Lesson.find(params[:lesson_id])
        end 

        def update
            lesson = Lesson.find(params[:lesson_id])
            lesson.update(lesson_params)
            redirect_to "/lessons/#{lesson.id}"
        end 

        def destroy
            lesson = Lesson.find(params[:id])
            lesson.destroy  
            redirect_to '/lessons'
        end

        private
        def lesson_params
            params.permit(:name, :format, :questions, :complete)  
        end 
end 