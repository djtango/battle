require 'game'

describe Game do
  subject(:game) { described_class.new(player_klass, "deon", "fergus") }
  let(:player_klass) { double(:player_klass) }
  let(:deon) { double(:player) }
  let(:fergus) { double(:player) }

  before do
    allow(player_klass).to receive(:new).and_return(deon, fergus)
  end

  it 'instantiates with a player 1' do
    expect(game.player1).to eq deon
  end

  it 'instantiates with a player 2' do
    expect(game.player2).to eq fergus
  end

  it "has an attack method with a default damage" do
    expect(game.attack).to eq described_class::DEFAULT_DAMAGE
  end
end
