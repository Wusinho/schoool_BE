class CreateStudentLevel < ActiveRecord::Migration[7.0]
  def change
    create_table :student_levels do |t|
      t.integer :grade_level, null: false
      t.integer :grade, null: false
      t.integer :section, null: false

      t.timestamps
    end
  end
end
