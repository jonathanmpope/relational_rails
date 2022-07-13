class CourseLessonsController < ApplicationController

    def index
        @course = Course.find(params[:course_id])
        if params[:sort] == "alphabet" 
            @lessons = @course.lessons.alphabet_order 
        elsif params[:number] != nil 
            @lessons = @course.lessons.questions(params[:number])
        else 
            @lessons = @course.lessons
        end 
    end 

    def new 
        @course = Course.find(params[:id])
    end 

    def create
        course = Course.find(params[:course_id])
        course.lessons.create(lesson_params)
        redirect_to "/courses/#{course.id}/lessons"
    end 

    private
    def lesson_params
        params.permit(:name, :format, :questions, :complete)  
    end 
end 