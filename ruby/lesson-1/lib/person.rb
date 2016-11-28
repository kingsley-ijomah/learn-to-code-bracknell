class Person
  attr_reader :firstname, :lastname, :email, :dob

  def initialize(firstname, lastname, email, dob)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @dob = dob
  end

  def age
    Time.now.year - dob.year
  end
end

person = Person.new('kingsley', 'ijomah', 'kingsley@test.com', Time.new(1982, 10, 01))
person.age # => 34
