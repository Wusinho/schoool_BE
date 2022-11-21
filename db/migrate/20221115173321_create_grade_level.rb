class CreateGradeLevel < ActiveRecord::Migration[7.0]
  def change
    create_table :grade_levels do |t|
      t.integer :grade_level, null: false
      t.integer :grade, null: false
      t.integer :section, null: false

      t.timestamps
    end
  end
end
