class AddUniversityToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :university, :string
  end
end
