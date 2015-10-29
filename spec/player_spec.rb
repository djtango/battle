require 'player'

describe Player do
  subject(:player) {described_class.new('deon')}

  it "knows its name" do
    expect(player.name).to eq 'deon'
  end

  it "starts with 100HP" do
    expect(player.hp).to eq described_class::DEFAULT_HP
  end

  it "deducts 10HP when attacked successfully" do
    expect{ player.deduct_hp(10) }.to change{ player.hp }.by(-10)
  end
end
