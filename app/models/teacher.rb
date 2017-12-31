class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  #asociation
  has_many :subjects, through: :teacher_subjects
  has_many :teacher_subjects, dependent: :destroy
  has_one :student, through: :chat_groups
  has_many :chat_groups, dependent: :destroy
  has_many :messages, as: :messageable, dependent: :destroy

  #scope
  scope :search_with_address, -> (address){

    if address.present?
      where('address LIKE(?)', "%#{address}%")
    end

  }

  scope :search_with_subjects, ->  (subject_ids){

    if subject_ids.length != 1
      joins(:subjects).merge(Subject.id_in(subject_ids))
    end

 }

  scope :search_with_salary, -> (min, max){

    if min.present? && max.present?
      where(salary: min..max)
    end

  }

  #ビューで使用するメソッド
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

  def get_subjects
    if subjects.present?
      a_subjects = []
      subjects.each do |subject_record|
        a_subjects << subject_record.subject
      end
      return a_subjects.join(" ")
    else
      "登録されていません"
    end
  end
end
