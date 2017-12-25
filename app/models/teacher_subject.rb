class TeacherSubject < ApplicationRecord
  #asociation
  belongs_to :teacher
  belongs_to :subject
end
