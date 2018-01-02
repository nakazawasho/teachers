class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    Subject.create(subjects_params)
    redirect_to root_path
  end

  private
  def subjects_params
    params.require(:subject).permit(:subject)
  end
end
