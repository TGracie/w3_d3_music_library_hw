require_relative('./models/album.rb')
require_relative('./models/artist.rb')
require('pry')

Album.delete_all()
# Artist.delete_all()

  stadium_arcadium = Album.new({
    'album_name' => 'Stadium Arcadium',
    'genre' => 'rock'
    })

  staying_at_tams = Album.new({
    'album_name' => 'Staying at Tamara''s',
    'genre' => 'Singer-songwriter'
    })

    stadium_arcadium.save()
    staying_at_tams.save()

    binding.pry
    nil
