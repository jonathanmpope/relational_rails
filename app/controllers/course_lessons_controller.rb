class CourseLessonsController < ApplicationController

    def index
        @course = Course.find(params[:course_id])
        if params[:sort] == "alphabet" 
            @lessons = @course.lessons.alphabet_order 
        else 
            @lessons = @course.lessons
        end 
    end 

    def new 
        @course = Course.find(params[:id])
    end 

    def create
        course = Course.find(params[:course_id])
        course.lessons.create(name: params[:name], format: params[:format], questions: params[:questions], complete: false)
        redirect_to "/courses/#{course.id}/lessons"
    end 
end 