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
    erb :new_board
  end

  post '/game' do
    @ship = params[:ship]
    @direction = params[:direction]
    @coordinate = params[:coordinate]
    $GAME.player_1.board.place_ship(Ship.send(@ship.to_sym), @coordinate.to_sym, @direction.to_sym)
    redirect '/gameplay' if $GAME.player_1.board.ships.count > 2
    erb :new_board
  end

  get '/gameplay' do
    erb :gameplay
  end

  post '/gameplay' do
    @coordinate = params[:coordinate]
    @result = $GAME.player_1.shoot(@coordinate.to_sym)
    erb :gameplay
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
