class CoursesController < ApplicationController

    def index 
        @courses = Course.all 
        # binding.pry 
    end 

end 