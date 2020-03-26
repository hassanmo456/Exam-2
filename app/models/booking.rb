class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates_presence_of :room_id, :user_id
  validates_presence_of :start_date, :end_date 
  validate :end_date_after_start_date
  validate :start_date_in_past
  validate :end_date_in_past
  validates_date :start_date
  validates_date :end_date
  validates :user_id, presence:true, numericality: {greater_than:1}
  validates :room_id, presence:true, numericality: {greater_than:1}



  scope :chronological, -> {order('start_date', 'end_date')}
  scope :past, ->  {where('end_date < ?', Date.current)}
  scope :upcoming, ->  {where('start_date =< ?', Date.current)}


    
    def end_date_after_start_date
        unless start_date = end_date or end_date > start_date
            errors.add(:end_date, "End date must be after start date")
        end
    end
    
    def start_date_in_past
        unless start_date < Date.current
            errors.add(:start_date, "Start must be in the past")
        end
    end
   
   def end_date_in_past
        unless end_date < Date.current
            errors.add(:start_date, "Start must be in the past")
        end
    end
    
end
