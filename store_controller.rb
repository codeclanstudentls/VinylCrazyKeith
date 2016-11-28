require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/album')
require_relative('./models/artist')


get '/' do
  return "Test"
end


get '/albums' do
  @albums = Album.all() 
  erb ( :"albums/index" ) 
end

get '/artists' do
  @artists = Artist.all()
  erb ( :"artists/index" )
end

get '/artists/new' do
  erb( :"artists/new" )
end

post '/artists' do
  artist = Artist.new( params )
  artist.save
  redirect to('/artists')
end

get '/albums/new' do
  @artists = Artist.all
  erb( :"albums/new" )
end

post '/albums' do
  album = Album.new( params )
  album.save
  redirect to('/albums')
end


# get '/albums/:id' do
#   @album = Album.find( params[:id] )
#   erb ( :show )
# end





