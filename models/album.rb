require('pg')
require_relative('../db/sql_runner.rb')

class Album

  #####################################################################
  attr_accessor(:album_name, :genre)
  attr_reader(:id, :artist_id)
  #####################################################################

  def initialize(options)
    @id = options["id"].to_i
    @artist_id = options["artist_id"].to_i
    @album_name = options["album_name"]
    @genre = options["genre"]
  end

  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.delete_all()
    sql = 'DELETE FROM albums;'
    SqlRunner.run(sql)
  end

  #####################################################################

  def self.all()
    sql = 'SELECT * FROM albums;'

    album_hashes = SqlRunner.run(sql)

    album_objects = album_hashes.map do |album_hash| Album.new(album_hash)
    end
    return album_objects
  end
  #####################################################################
  #####################################################################
  ## OBJECT METHODS ##

  def save()
    sql = "
    INSERT INTO albums (
      artist_id,
      album_name,
      genre
      )
      VALUES ($1, $2, $3)
      RETURNING id;
      "
      values = [
        @artist_id,
        @album_name,
        @genre
      ]

      result = SqlRunner.run(sql, values)

      result_hash = result[0]
      string_id = result_hash['id']
      id = string_id.to_i
      @id = id
  end
  #####################################################################

  def update()
    sql = "
    UPDATE albums
    SET (
      artist_id,
      album_name,
      genre
      ) = ($1, $2, $3)
      WHERE id = $4;
      "
      values = [
        @artist_id,
        @album_name,
        @genre
      ]
      result = SqlRunner.run(sql, values)
  end
  #####################################################################

  def artist()
    sql = "
    SELECT * FROM artists
    WHERE id = $1;
    "
    results = SqlRunner.run(sql, [@artist_id])

    artist_hash = results[0]

    artist = Artist.new(artist_hash)

    return artist
  end
  ####################################################################

  def delete()
    sql = 'DELETE FROM albums
    WHERE id = $1'
    SqlRunner.run(sql, [@id])
  end

  ####################################################################
  ####################################################################
end ## CLASS END ##
