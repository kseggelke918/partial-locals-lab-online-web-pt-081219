class StudentsController < ApplicationController
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

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.search(params[:query])
    render 'index'
    # @students = Student.all 
    # if params[:query]
    #   @student = Student.where('query LIKE ?', "%#{params[:query]}%")
    # else
    #   @student = Student.all 
    # end 
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
