class Person
  attr_reader :firstname, :lastname, :dob

  def initialize(firstname, lastname, dob)
    @firstname = firstname
    @lastname = lastname
    @dob = dob
  end

  def age
    if birthday?
      this_year - dob.year
    elsif before_birthday?
      (this_year - dob.year) - 1
    elsif past_birthday?
      this_year - dob.year
    end
  end

  private

  def past_birthday?
    (dob.month == this_month and today > dob.day) or this_month > dob.month
  end

  def before_birthday?
    dob.month <= this_month and today < dob.day
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
