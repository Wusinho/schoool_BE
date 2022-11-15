class CreateVirtualclass < ActiveRecord::Migration[7.0]
  def change
    create_table :virtualclass do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
