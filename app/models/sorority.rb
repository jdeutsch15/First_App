class Sorority < ActiveRecord::Base
	has_many :people
  attr_accessible :location, :name
end
