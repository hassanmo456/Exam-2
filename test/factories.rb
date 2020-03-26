FactoryBot.define do

  factory :user do
    first_name {"Alex"}
    last_name {"Heimann"}
    email {"fred@andrew.cmu.edu"}
    active {true}
    phone {rand(10 ** 10).to_s.rjust(10,'0') }
    email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
  end

    factory :room do
      room_number 321
      room_type "Double"
      booked true
    end

    factory :booking do
     
      association :user  
      association :room
      start_date {2.years.ago.to_date}
      end_date {1.year.ago.to_date}

    end
    
end
