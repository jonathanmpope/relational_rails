class CourseLessonsController < ApplicationController

    def index
        @lessons = Course.find(params[:course_id]).lessons
    end 

end 