class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        student = Student.create!(params.require(:student).permit(:first_name, :last_name))

        redirect_to action: "show", id: student.id
    end

    def show 
        @student = Student.find_by_id(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end 

    def update
        student = Student.find(params[:id])
        student.first_name = params[:student][:first_name]
        student.last_name = params[:student][:last_name]
        student.save!

        redirect_to action: "show", id: student.id
    end
end