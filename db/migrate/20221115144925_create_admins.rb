class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :level, null: false
      t.integer :ed_level, default: ''
      t.string :section, default: ''
      t.string :email, null: false
      t.index :email, unique:true
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
