class SchoolClassesController < ApplicationController
    def new
        @class = SchoolClass.new
    end

    def create
        school_class = SchoolClass.create!(params.require(:school_class).permit(:room_number, :title))

        redirect_to action: "show", id: school_class.id
    end

    def show 
        @class = SchoolClass.find_by_id(params[:id])
    end

    def edit
        @class = SchoolClass.find(params[:id])
    end 

    def update
        school_class = SchoolClass.find(params[:id])
        school_class.title = params[:school_class][:title]
        school_class.room_number = params[:school_class][:room_number].to_i
        school_class.save!

        redirect_to action: "show", id: school_class.id
    end
end