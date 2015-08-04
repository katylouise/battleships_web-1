require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/register' do
    $name = params[:name]
    erb :form
  end

  get '/game' do

    $GAME = Game.new(Player, Board)
    $DESTROYER = Ship.destroyer
    $AIRCRAFT_CARRIER = Ship.aircraft_carrier
    erb :new_board
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
