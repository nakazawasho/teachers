class TeachersController < ApplicationController
  def index
    @teachers = Teacher.page(params[:page]).per(10)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @teacher_id = params[:id]
    render layout: "application_show"
  end

  def edit
    @teacher = Teacher.find(params[:id])
    render layout: "application_show"
  end

  def update
    Teacher.find(params[:id]).update(teacher_params)
    redirect_to teacher_path(params[:id])
  end

  def search
  end

  def start_searching
    @teachers = Teacher.search_with_address(params[:search][:address]).search_with_subjects(params[:search][:subject_ids]).search_with_salary(params[:search][:salary_min].to_s, params[:search][:salary_max].to_s)
  end

  def facebook_login
    render 'teachers/registrations/facebook_login'
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :image, :university, :department, :address, :profile, {subject_ids: []})
  end
end
