class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.references :grade_level, null: false, foreign_key: true
      t.integer :participants, null: false

      t.timestamps
    end
  end
end
