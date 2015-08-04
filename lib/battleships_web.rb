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
    $GAME = Game.new(Player, Board)
    $DESTROYER = Ship.destroyer
    $AIRCRAFT_CARRIER = Ship.aircraft_carrier
    # PLACE SHIP METHOD if Params != &&
    erb :new_board
  end

  post '/game' do
    @ship = params[:ship]
    @direction = params[:direction]
    @coordinate = params[:coordinate]
    $GAME.player_1.board.place_ship(Ship.send(@ship.to_sym), @coordinate.to_sym, @direction.to_sym)
    erb :new_board
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
