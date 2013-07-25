class AddEventIdToEventNotes < ActiveRecord::Migration
  def change
  	 add_column :event_notes, :event_id, :integer
  end
end
