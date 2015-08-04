require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/register' do
    @name = params[:name]
    erb :form
  end

  get '/start_game' do
    "hdjkfhdskjhf"
  end

  set :views, Proc.new { File.join(root, "..", "views") }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
