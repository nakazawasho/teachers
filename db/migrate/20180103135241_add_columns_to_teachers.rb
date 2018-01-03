class AddColumnsToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :uid, :string
    add_column :teachers, :provider, :string
  end
end
