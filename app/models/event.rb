class Event < ActiveRecord::Base
	letsrate_rateable "fun", "drinks", "music", "people"
	has_and_belongs_to_many :houses, :uniq => true
	has_many :ratings
	has_many :raters, :through => :ratings, :source => :students
	has_many :invitations
	has_many :event_notes
  attr_accessible :description, :location, :name, :event_type, :house_id, :host_id, :start_time

def average_rating 
	@value=0
	self.ratings.each do |rating|
		@value=@value +rating.value
	end
	@total=self.ratings.size
	@value.to_f / @total.to_f
end


end
