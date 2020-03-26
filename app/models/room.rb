
class Room < ApplicationRecord
   has_many :bookings
   has_many:users, through: :bookings
   
   validates_presence_of :room_type, :room_number
   validates_inclusion_of :room_number, :in => 100..500
   validates_inclusion_of :room_type, in: %w(Double Suite Single), message: "room type must be one of double, single or suite"
    
   scope :booked, ->{where(booked:true)}


end