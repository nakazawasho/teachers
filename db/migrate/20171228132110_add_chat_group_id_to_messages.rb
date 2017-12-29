class AddChatGroupIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :chat_group, foreign_key: true
  end
end
