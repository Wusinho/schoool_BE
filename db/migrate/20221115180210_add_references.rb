class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :edlevel, foreign_key: true
    add_reference :teachers, :edlevel, foreign_key: true
    add_reference :subjects, :edlevel, foreign_key: true
    add_reference :users, :section, foreign_key: true
    add_reference :teachers, :section, foreign_key: true
    add_reference :subjects, :section, foreign_key: true
  end
end
