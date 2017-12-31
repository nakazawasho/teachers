class TeachersController < ApplicationController
  def index
    @teachers = Teacher.page(params[:page]).per(10)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @teacher_id = params[:id]
    render layout: "application_show"
  end

  def search
  end

  def start_searching
    @teachers = Teacher.search_with_address(params[:search][:address]).search_with_subjects(params[:search][:subject_ids]).search_with_salary(params[:search][:salary_min].to_s, params[:search][:salary_max].to_s)
  end
end
