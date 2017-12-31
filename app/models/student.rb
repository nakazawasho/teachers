class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :teacher, through: :chat_groups
  has_many :chat_groups, dependent: :destroy
  has_many :messages, as: :messageable, dependent: :destroy

  mount_uploader :image, ImageUploader
end
