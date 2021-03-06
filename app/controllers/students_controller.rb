class StudentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_student, only: [:show,:edit,:update,:destroy] 
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @student = Student.All
      
  end

  

  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
 end
 def show
    @student = Student.find(params[:id])
    @students = Student.accessible_by(current_ability,params[:action].to_sym)
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
