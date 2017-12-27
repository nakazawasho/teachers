class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    render layout: "application_show"
  end

  def search
    @teachers
  end

end
