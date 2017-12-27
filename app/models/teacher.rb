class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  #asociation
  has_many :subjects, through: :teacher_subjects
  has_many :teacher_subjects
  accepts_nested_attributes_for :teacher_subjects

  def get_initial_50
    if profile.present?
      profile.slice(0, 49) + "......................."
    else
      "まだ挨拶文がありません。"
    end
  end

  def get_image
    if image.present?
      image
    else
      "no-image.jpg"
    end
  end
end
