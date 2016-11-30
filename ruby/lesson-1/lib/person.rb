class Person
  attr_reader :firstname, :lastname, :dob

  def initialize(firstname, lastname, dob)
    @firstname = firstname
    @lastname = lastname
    @dob = dob
  end

  def age
    if birthday? || past_birthday?
      calculate_age
    else 
      calculate_age - 1
    end
  end

  private

  def calculate_age
    this_year - dob.year
  end

  def past_birthday?
    (dob.month == this_month and today > dob.day) or this_month > dob.month
  end

  def birthday?
    dob.month == this_month and dob.day == today
  end

  def current_date
    Time.now
  end

  def this_month
    current_date.month
  end

  def today
    current_date.day
  end

  def this_year
    current_date.year
  end
end
