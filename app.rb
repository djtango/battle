require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'string'

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect to('/play')
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    erb(:play)
  end

  post '/play' do
    $game = Game.new
    @game = $game
    # $attack = Attack.new
    @player2 = $player2
    @player2.deduct_hp(@game.attack)
    redirect to('/attack')
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    @game = $game
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
