require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  #####################################################################
  attr_accessor(:name)
  attr_reader(:id)
  #####################################################################

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

  #####################################################################

  def self.all()
    sql = 'SELECT * FROM artists;'

    artist_hashes = SqlRunner.run(sql)

    artist_objects = artist_hashes.map do |artist_hash| Artist.new(album_hash)
    end
    return artist_objects
  end
  #####################################################################
  #####################################################################
  ## OBJECT METHODS ##

  def save()
    sql = "
    INSERT INTO artists (
      first_name,
      last_name
      )
      VALUES ($1, $2)
      RETURNING id;
      "
      values = [
        @first_name,
        @last_name
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
    UPDATE artists
    SET (
      first_name,
      last_name
      )"
  end

  #####################################################################
  #####################################################################
end ## CLASS END ##
