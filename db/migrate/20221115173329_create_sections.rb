class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.integer :section, null: false, default: 0

      t.timestamps
    end
  end
end
