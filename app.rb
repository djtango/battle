require 'sinatra/base'
require './lib/player.rb'
require './lib/attack.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'string'

  get '/' do
    erb(:index)
  end

  get '/play' do
    p "GET /play"
    p "session: #{session}"
    erb(:play)
  end

  post '/names' do
    p "POST /names"
    p "Session before setting: #{session}"
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    p "Session after setting: #{session}"
    redirect to('/play')
  end

  post '/play' do
    $attack = Attack.new
    $player2.deduct_hp($attack.damage)
    redirect to('/attack')
  end

  get '/attack' do
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
