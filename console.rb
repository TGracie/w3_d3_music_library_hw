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

  stadium_arcadium = Album.new({
    'album_name' => 'Stadium Arcadium',
    'genre' => 'Rock'
    })

  staying_at_tams = Album.new({
    'album_name' => 'Staying at Tamara''s',
    'genre' => 'Singer-songwriter'
    })

    stadium_arcadium.save()
    staying_at_tams.save()

    # albums = Album.all()

    binding.pry
    nil
