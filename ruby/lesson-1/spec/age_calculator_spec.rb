require 'age_calculator' 

RSpec.describe AgeCalculator do
  let(:birthday) { Time.new(1982, 9, 21) }
  let(:calculator) { AgeCalculator.new(birthday) }

  context 'when it is your birthday' do
    let(:today) { Time.new(2016, 9, 21) }

    it 'calculates age' do
      allow_any_instance_of(AgeCalculator).to receive(:current_date) { today }
      expect(calculator.age).to eq (today.year - birthday.year)
    end
  end

  context 'when it is not yet your birthday' do
    let(:today) { Time.new(2016, 9, 20) }

    it 'calculates age minus one' do
      allow_any_instance_of(AgeCalculator).to receive(:current_date) { today }
      expect(calculator.age).to eq (today.year - birthday.year) - 1
    end
  end


  context 'when it is past your birthday' do
    let(:today) { Time.new(2016, 10, 21) }

    it 'calculates age' do
      allow_any_instance_of(AgeCalculator).to receive(:current_date) { today }
      expect(calculator.age).to eq (today.year - birthday.year)
    end
  end
end
