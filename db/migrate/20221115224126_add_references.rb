class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :classroom, foreign_key: true
    add_reference :subjects, :classroom, foreign_key: true
    add_reference :subjects, :course, foreign_key: true
    add_reference :teachers, :subject, foreign_key: true

  end
end
