require_relative('./models/album.rb')
require_relative('./models/artist.rb')
require('pry')

Album.delete_all()
Artist.delete_all()

  rhcp = Artist.new({
    'first_name' => 'Red Hot',
    'last_name' => 'Chilli Peppers'
    })
    rhcp.save()

    ezra = Artist.new({
      'first_name' => 'George',
      'last_name' => 'Ezra'
      })
      ezra.save

  album1 = Album.new({
    'artist_id' => rhcp.id,
    'album_name' => 'Stadium Arcadium',
    'genre' => 'Rock'
    })

  album2 = Album.new({
    'artist_id' => ezra.id,
    'album_name' => 'Staying at Tamara''s',
    'genre' => 'Singer-songwriter'
    })

    album1.save()
    album2.save()

    # albums = Album.all()

    binding.pry
    nil
