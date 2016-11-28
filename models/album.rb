require('pg')
require_relative('../db/sql_runner')
#do I need to require_relative('artist') here?

class Album
  attr_accessor :title, :quantity, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, quantity, artist_id)
    VALUES ('#{@title}', #{@quantity}, #{@artist_id})
    RETURNING *;"

    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  # Thought this would be better to delete album by id.  John said its not good to delete artist as then you'll get conflicts of foreign keys as album class relies on artist_id
  def self.destroy( id )
    sql = "DELETE FROM albums WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |hash| Album.new(hash) }
  end

#have a method in here that looks at the artist id and gives back a name ie no need to have an inner join.  look at Val's Zombie bitings part or even Beths Trip advisor? for hints on how to do it.
def artist_name_from_id()
  sql = 
  "SELECT * FROM artists
  WHERE id = #{@artist_id};"
  artist = SqlRunner.run(sql)
  name = artist[0]['name']
  return name
end



end