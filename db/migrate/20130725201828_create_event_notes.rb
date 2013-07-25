class CreateEventNotes < ActiveRecord::Migration
  def change
    create_table :event_notes do |t|
      t.string :content
      t.integer :student_id

      t.timestamps
    end
  end
end
