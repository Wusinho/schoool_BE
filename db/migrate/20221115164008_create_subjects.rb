class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :participants, null: false
      t.integer :times_week, null:false

      t.timestamps
    end
  end
end
