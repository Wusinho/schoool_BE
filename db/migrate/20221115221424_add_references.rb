class AddReferences < ActiveRecord::Migration[7.0]
  def change
    def change
      add_reference :students, :classroom, foreign_key: true
    end
  end
end
