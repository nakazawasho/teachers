class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    render layout: "application_show"
  end

  def search
  end

  def start_searching
    # @teachers = Teacher.search_with_name(params[:search][:name])
    @teachers = Teacher.search_with_subjects(params[:search][:subject_ids])
    # @teachers = Teacher.search_with_name(params[:name]).search_with_subjects(params[:subject])
  end
end
