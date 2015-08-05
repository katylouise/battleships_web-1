require 'sinatra/base'
require 'battleships'


class BattleshipsWeb < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/register' do
    erb :form
  end

  post '/register' do
    session[:name] = params[:name]
    redirect '/register' if session[:name] == ""
    redirect '/welcome'
  end

  get '/welcome' do
    erb :welcome
  end

  get '/game' do
    $game = Game.new(Player, Board)
    erb :new_board
  end

  post '/game' do
    @parameters = params
    $game.player_1.board.place_ship(Ship.send(@parameters[:ship].to_sym), @parameters[:coordinate].to_sym, @parameters[:direction].to_sym)
    redirect '/gameplay' if $game.player_1.board.ships.count > 2
    erb :new_board
  end

  get '/gameplay' do
    erb :gameplay
  end

  post '/gameplay' do
    @coordinate = params[:coordinate]
    @result = $game.player_1.shoot(@coordinate.to_sym)
    erb :gameplay
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
