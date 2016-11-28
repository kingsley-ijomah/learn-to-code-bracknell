require 'person' # ~> LoadError: cannot load such file -- person

RSpec.describe Person, '#age' do
  let(:person) { build(:person) }

  it 'returns the right age' do
    expect(person.age).to eq(34) # => 
  end
end
