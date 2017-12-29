class MessagesController < ApplicationController
  def create
    if current_teacher
      current_teacher.messages.create(message_params)
      redirect_to chat_group_path(params[:chat_group_id])
    elsif current_student
      current_student.messages.create(message_params)
      redirect_to chat_group_path(params[:chat_group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(chat_group_id: params[:chat_group_id])
  end
end
