require 'person' 

RSpec.describe Person do
  # if your birthday is 1982-9-21
  #
  # ( your birthday )
  # if today is 2016-9-21
  # age is 2016 - 1982 = 34
  # month_of_birth and day_of_birth = this_month and today
  #
  # ( before your birthday )
  # if today is 2016-9-20
  # age is (2016 - 1982) - 1 = 33
  # ((month_of_birth less than or equal to this_month) and (today is less than day_of_birth)) or this month > month of birth
  #
  # ( birthday passed )
  # if today is 2016-10-20
  # age is 2016 - 1982 = 34
  # (month_of_birth greater than or equal to this_month) and (today is greater than day_of_birth)

  let(:birthday) { Time.new(1982, 9, 21) }
  let(:person) { Person.new('kingsley', 'ijomah', birthday) }

  context 'when it is your birthday' do
    let(:today) { Time.new(2016, 9, 21) }

    it 'calculates age' do
      allow_any_instance_of(Person).to receive(:current_date) { today }
      expect(person.age).to eq (today.year - birthday.year)
    end
  end

  context 'when it is not yet your birthday' do
    let(:today) { Time.new(2016, 9, 20) }

    it 'calculates age minus one' do
      allow_any_instance_of(Person).to receive(:current_date) { today }
      expect(person.age).to eq (today.year - birthday.year) - 1
    end
  end


  context 'when it is past your birthday' do
    let(:today) { Time.new(2016, 10, 21) }

    it 'calculates age' do
      allow_any_instance_of(Person).to receive(:current_date) { today }
      expect(person.age).to eq (today.year - birthday.year)
    end
  end
end

