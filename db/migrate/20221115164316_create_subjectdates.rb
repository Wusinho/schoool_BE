class CreateSubjectdates < ActiveRecord::Migration[7.0]
  def change
    create_table :subjectdates do |t|
      t.string :week_day, null: false
      t.time :starts_at, null: false
      t.time :ends_at, null: false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
