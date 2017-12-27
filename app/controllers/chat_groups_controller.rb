class ChatGroupsController < ApplicationController
  def show
    @chat_group = ChatGroup.find(params[:id])
  end
  def create
    new_chat_group = ChatGroup.create(chat_group_params)
    redirect_to chat_group_path(new_chat_group)
  end

  private
  def chat_group_params
    params.permit(:student_id, :teacher_id)
  end
end
