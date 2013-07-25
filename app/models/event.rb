class Event < ActiveRecord::Base
	has_and_belongs_to_many :houses, :uniq => true
	has_many :invitations
	has_many :event_notes
  attr_accessible :description, :location, :name, :event_type, :house_id, :host_id, :start_time
end
