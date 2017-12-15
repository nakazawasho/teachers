class AddColumnsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :name, :string
    add_column :students, :age,  :integer
    add_column :students, :address, :text
    add_column :students, :subject, :string
  end
end
