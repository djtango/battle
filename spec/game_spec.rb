require 'game'

describe Game do
  subject(:game) {described_class.new}
  it "has an attack method with a default damage" do
    expect(game.attack).to eq described_class::DEFAULT_DAMAGE
  end
end