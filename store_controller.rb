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

get '/artists' do
  @artists = Artist.all()
  erb ( :index )
end

get '/artists/new' do
  erb( :new )
end

# get '/albums/:id' do
#   @album = Album.find( params[:id] )
#   erb ( :show )
# end

# get '/albums/new' do
#   erb( :new )
# end
