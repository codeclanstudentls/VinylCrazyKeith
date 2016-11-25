require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({ 'name' => ''})
artist2 = Artist.new({ 'name' => ''})
artist3 = Artist.new({ 'name' => ''})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({ 'title' => '', 'quantity' => 50, 'artist_id' => artist2.id})
album2 = Album.new({ 'title' => '', 'quantity' => 100, 'artist_id' => artist1.id})
album3 = Album.new({ 'title' => '', 'quantity' => 20, 'artist_id' => artist1.id})

album1.save()
album2.save()
album3.save()

binding.pry
nil
