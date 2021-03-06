require('pg')
require_relative('../db/sql_runner')
require_relative('album')


class Artist
  attr_accessor :name
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) 
    VALUES ('#{@name}') RETURNING *;"

    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{ |hash| Artist.new(hash) }
  end

  def self.delete_all()
    sql = "SELECT FROM artists;"
    SqlRunner.run(sql)
  end


end
