class CoursesController < ApplicationController

    def index 
        @courses = Course.all.order(:created_at)
    end 

    def show 
        @course = Course.find(params[:id])
        binding.pry
    end 

end 