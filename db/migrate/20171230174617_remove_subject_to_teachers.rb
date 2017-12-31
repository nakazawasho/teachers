class RemoveSubjectToTeachers < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :subject, :string
  end
end
