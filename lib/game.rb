class Game
  DEFAULT_DAMAGE = 10

  attr_reader :player1, :player2

  def initialize(player_klass = Player, name1, name2)
    @player1 = player_klass.new(name1)
    @player2 = player_klass.new(name2)
  end

  def attack
    DEFAULT_DAMAGE
  end
end
