class CoursesController < ApplicationController

    def index 
        @courses = Course.course_order 
    end 

    def show 
        @course = Course.find(params[:id])
    end 

    def new 
    end 

    def create
        Course.create(course_params)
        redirect_to "/courses"
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        course = Course.find(params[:id])
        course.update(course_params)
        redirect_to "/courses/#{course.id}"
    end 

    def destroy
        course = Course.find(params[:id])
        course.lessons.destroy_all
        course.destroy 
        redirect_to '/courses'
    end 

    private
    def course_params
	    params.permit(:name, :participants, :complete)  
    end 
end 