class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new,status: :unprocessable_entity
    end
  end
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student, notice: 'Student updated successfully'
    else
      render :edit
    end
  end


  def show
    @student = Student.find(params[:id])
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name)
  end
end