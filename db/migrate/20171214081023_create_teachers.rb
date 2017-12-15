class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string  :name
      t.string  :university
      t.string  :department
      t.string  :subject
      t.string  :salary
      t.text    :profile
      t.string  :image
      t.integer :age

      t.timestamps
    end
  end
end
