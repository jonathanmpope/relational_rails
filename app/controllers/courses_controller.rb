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
        Course.create(name: params[:name], participants: 0, complete: false)
        redirect_to "/courses"
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        course = Course.find(params[:id])
        course.update(name: params[:name])
        redirect_to "/courses/#{course.id}"
    end 

    def destroy
        course = Course.find(params[:id])
        course.lessons.destroy_all
        course.destroy 
        redirect_to '/courses'
    end 

end 