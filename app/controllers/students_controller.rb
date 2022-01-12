class StudentsController < ApplicationController
  before_action :find_student, only: [:show,:edit,:update,:destroy] 
  def index
    @students = Student.all
  end

  

  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
 end
 def show
    @student = Student.find(params[:id])
  end
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
   if @student.update(student_params)
     redirect_to @student
    else
      render 'edit'
    end
  end
  def destroy
    @student.destroy
    redirect_to root_path,staus: :students_record_deleted
  end
  def find_student
    @student = Student.find(params[:id])
  end

  private
  
  def student_params
    params.require(:student).permit(:name,:class_section,:home_work)
  end
end
