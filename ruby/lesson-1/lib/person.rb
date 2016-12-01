require 'age_calculator'

class Person
  attr_reader :firstname, :lastname, :dob

  def initialize(firstname, lastname, dob)
    @firstname = firstname
    @lastname = lastname
    @dob = dob
  end

  def age
    age_calculator.age
  end

  private

  def age_calculator
    AgeCalculator.new(dob)
  end
end
