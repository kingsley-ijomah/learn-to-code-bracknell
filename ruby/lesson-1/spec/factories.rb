FactoryGirl.define do 
  factory :person do
    firstname 'kingsley'
    lastname 'ijomah'
    email 'kingsley@test.com'
    dob Time.new(1982, Time.now.month, Time.now.day)
    initialize_with { new(firstname, lastname, email, dob) }
  end
end
