class House < ActiveRecord::Base
	has_and_belongs_to_many :events, :uniq => true
	has_many :students
  attr_accessible :location, :name, :type
  
end
