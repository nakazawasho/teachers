class ChatGroupsController < ApplicationController
  def show
    @chat_group = ChatGroup.find(params[:id])
    @messages = @chat_group.messages
    @message = Message.new
  end

  def create
    chat_group = ChatGroup.check_chat(params[:student_id], params[:teacher_id])
    redirect_to chat_group_path(id: chat_group.id)
  end

  private
  def chat_group_params
    params.permit(:student_id, :teacher_id)
  end
end
