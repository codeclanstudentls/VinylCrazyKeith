require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/album')

get '/' do
  return "Test"
end


get '/albums' do
  @albums = Album.all() 
  erb ( :index ) 
end