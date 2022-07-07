class CourseLessonsController < ApplicationController

    def index
        @lessons = Course.find(params[:course_id]).lessons
        @course = Course.find(params[:course_id])
    end 

    def new 
    end 
end 