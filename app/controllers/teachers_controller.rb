class TeachersController < ApplicationController
  def index
  end

  def new
    @teacher = Teacher.new
  end

  def create
    Teacher.create(teacher_params)
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
