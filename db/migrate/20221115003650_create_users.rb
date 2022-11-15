class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :grade, null: false
      t.string :section, null: false
      t.string :email, null: false
      t.index :email, unique:true
      t.string :password_digest, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end