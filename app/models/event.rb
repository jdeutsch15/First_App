class Event < ActiveRecord::Base
	has_and_belongs_to_many :houses, :uniq => true
  attr_accessible :description, :location, :name, :event_type, :house_id, :start_time
end
