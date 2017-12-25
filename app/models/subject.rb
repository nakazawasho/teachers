class Subject < ApplicationRecord
  #asociation
  has_many :teachers, through: :teacher_subjects
  has_many :teacher_subjects
end
