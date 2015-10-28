require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions  

  get '/' do
    p params
    p session
    erb(:index)
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    p params
    p session
    p @player_1_name
    p @player_2_name
    p $p1n,$p2n
    erb(:play)
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    $p1n = params[:player_1_name]
    $p2n = params[:player_2_name]
    p params
    p session
    p "/names",session[:player_1_name]
    p $p1n,$p2n
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
