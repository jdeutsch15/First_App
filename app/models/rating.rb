class Rating < ActiveRecord::Base
  attr_accessible :event_id, :sudent_id, :value
  belongs_to :event
  belongs_to :student
end
