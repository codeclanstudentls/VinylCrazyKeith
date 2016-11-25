require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({ 'name' => 'Mr. Scruff'})
artist2 = Artist.new({ 'name' => 'Aphex Twin'})
artist3 = Artist.new({ 'name' => 'Orbital'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({ 'title' => 'Drukqs', 'quantity' => 50, 'artist_id' => artist2.id})
album2 = Album.new({ 'title' => 'Keep it Unreal', 'quantity' => 100, 'artist_id' => artist1.id})
album3 = Album.new({ 'title' => 'Trouser Jazz', 'quantity' => 20, 'artist_id' => artist2.id})
album4 = Album.new({ 'title' => 'In Sides', 'quantity' => 80, 'artist_id' => artist3.id})


album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil
