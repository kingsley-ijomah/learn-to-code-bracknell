require 'person'
require 'age_calculator'

RSpec.describe Person do
  let(:birthday) { Time.new(1982, 10, 15) }
  let(:person) { Person.new('kingsley', 'ijomah', birthday) }

  describe '#attr_reader' do
    it 'returns firstname' do
      expect(person.firstname).to eq('kingsley')
    end

    it 'returns lastname' do
      expect(person.lastname).to eq('ijomah')
    end

    it 'returns dob' do
      expect(person.dob).to eq(Time.new(1982, 10, 15))
    end
  end

  describe '#age' do
    it 'age method is called on AgeCalculator' do
      # instance_double makes sure :age method exists in AgeCalculator
      allow(AgeCalculator).to receive(:new).with(birthday) { instance_double('AgeCalculator', age: 34) }
      allow_any_instance_of(AgeCalculator).to receive(:age) { 34 }
      expect(person.age).to eq(34)
    end
  end
end
