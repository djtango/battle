require 'attack'

describe Attack do
  subject(:attack) { described_class.new }

  it 'has a damage value' do
    expect(attack.damage).to eq described_class::DEFAULT_DAMAGE
  end
end
