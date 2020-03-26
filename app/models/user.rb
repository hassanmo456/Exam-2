class User < ApplicationRecord
    has_many :bookings
    has_many :rooms, through: :bookings
    
    validates_presence_of :first_name, :last_name, :email
    validates_uniqueness_of :email
    validates_format_of :phone, with:/\A[(]?[0-9]{3}[-   . ) ]?[0-9]{3}[ -   . ]?[0-9]{4}\z/
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
    validates_numericality_of :phone
    before_save :normalize_phone_number

    scope :alphabetical, ->{order('last_name, first_name')}
    scope :active, ->{where(active:true)}
    
    def normalize_phone_number
        self.phone = phone.gsub(/[^0-9]/, ". -") if self.phone?
    end

end
