class ResultsController < ApplicationController
  before_action :set_result, only: [:new,:edit]
  
  def new
    @student = Student.find(params[:student_id])
    # @result = @student.build_result
    # 
    @result = Result.new
    
  end
  

  def create
    @student = Student.find(params[:student_id])
    @result = @student.build_result(result_params)
    if @result.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end
  
  def edit 
  end
  def update
    @student = Student.find(params[:student_id])
    @result = @student.result
    if @result.update(marks: params[:result][:marks])
      redirect_to @student, notice: 'Marks updated successfully'
    else
      render :edit
    end
  end

  def show
    @student = Student.find(params[:student_id])

    @result = @student.result
  end
  def destroy
    @student = Student.find(params[:student_id])
    @student.result.destroy
    redirect_to student_path(@student), notice: "Result deleted successfully"
  end

  private
  def set_result
    @student = Student.find(params[:student_id])
    if @student.result
      redirect_to root_path
    end
  end

  def result_params
    params.require(:result).permit(:marks)
  end

end
