require 'player'

describe Player do
  subject(:player) {described_class.new('deon')}
  it "knows its name" do
    expect(player.name).to eq 'deon'
  end
end