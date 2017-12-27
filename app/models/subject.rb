class Subject < ApplicationRecord
  #asociation
  has_many :teachers, through: :teacher_subjects
  has_many :teacher_subjects, dependent: :destroy

  #scope
  scope :id_in, -> (ids){ where(id: ids) if ids.present? }
end
