require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'string'

  get '/' do
    erb(:index)
  end

  get '/play' do
    p "GET /play"
    p "session: #{session}"
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @player_2_HP = 100
    erb(:play)
  end

  post '/names' do
    p "POST /names"
    p "Session before setting: #{session}"
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    p "Session after setting: #{session}"
    # $p1n = params[:player_1_name]
    # $p2n = params[:player_2_name]
    redirect to('/play')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
