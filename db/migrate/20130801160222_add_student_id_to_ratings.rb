class AddStudentIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :student_id, :string
    remove_column :ratings, :sudent_id
  end
end
