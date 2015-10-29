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
    name1 = params[:player_1_name]
    name2 = params[:player_2_name]
    $game = Game.new(Player, name1, name2)
    redirect to('/play')
  end

  get '/play' do
    @player1 = $game.player1
    @player2 = $game.player2
    erb(:play)
  end

  post '/play' do
    @game = $game
    # $attack = Attack.new
    @player2 = $game.player2
    @player2.deduct_hp(@game.attack)
    redirect to('/attack')
  end

  get '/attack' do
    @game = $game
    @player1 = $game.player1
    @player2 = $game.player2
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
