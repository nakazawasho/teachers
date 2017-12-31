class ChatGroup < ApplicationRecord
  #asociation
  has_many :messages, dependent: :destroy

  # 同じ講師と生徒のチャットグループがないかチェックする
  def self.check_chat(student_id, teacher_id)
    chat_group = ChatGroup.where(["student_id = ? and teacher_id = ?", student_id, teacher_id])
    if chat_group.present?
      chat_group.first
    else
      ChatGroup.create(student_id: student_id, teacher_id: teacher_id)
    end
  end
end
