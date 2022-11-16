class CreateSubjectdates < ActiveRecord::Migration[7.0]
  def change
    create_table :subjectdates do |t|
      t.integer :week_day, default: 0
      t.time :starts_at, null: false
      t.time :ends_at, null: false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
