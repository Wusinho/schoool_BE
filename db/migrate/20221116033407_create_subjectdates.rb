class CreateSubjectdates < ActiveRecord::Migration[7.0]
  def change
    create_table :subjectdates do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :timetable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
