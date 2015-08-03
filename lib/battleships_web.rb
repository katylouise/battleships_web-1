require 'sinatra/base'
require 'shotgun'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/game' do
    @variable = params[:name]
    erb :form
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end


