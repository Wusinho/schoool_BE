class CreateTimetables < ActiveRecord::Migration[7.0]
  def change
    create_table :timetables do |t|
      t.integer :week_day, default: 0
      t.integer :starts_at, null: false
      t.integer :ends_at, null: false

      t.timestamps
    end
  end
end
