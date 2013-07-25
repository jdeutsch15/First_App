class EventNote < ActiveRecord::Base
  attr_accessible :content, :student_id, :event_id

  belongs_to :student
  belongs_to :event
  validates :student_id, presence: true
 
  validates :content, presence: true, length: {maximum: 150}
  default_scope order: 'event_notes.created_at DESC'

 

end
