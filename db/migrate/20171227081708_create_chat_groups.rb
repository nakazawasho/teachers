class CreateChatGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_groups do |t|
      t.references :teacher, foregin_key: true
      t.references :student, foregin_key: true
      t.timestamps
    end
  end
end
