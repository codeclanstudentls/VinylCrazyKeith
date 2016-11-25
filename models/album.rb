require('pg')
require_relative('../db/sql_runner')

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

  def self.all
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |hash| Album.new(hash) }
  end





end