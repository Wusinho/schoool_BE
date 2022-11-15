class CreateEdlevels < ActiveRecord::Migration[7.0]
  def change
    create_table :edlevels do |t|
      t.integer :ed_level, null: false
      t.string :nivel, null: false

      t.timestamps
    end
  end
end
