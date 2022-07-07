class CoursesController < ApplicationController

    def index 
        @courses = Course.all.order(:created_at)
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

end 