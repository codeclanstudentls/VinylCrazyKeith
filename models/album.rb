require('pg')
require_relative('../db/sql_runner')
#do I need to require_relative('artist') here?

class Album
  attr_accessor :title, :quantity, :artist_id, :genre, :buy_price, :sell_price
  attr_reader :id

  def initialize(options) #should I have a 'not null' somewhere below?
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i 
    @artist_id = options['artist_id'].to_i
    @genre = options['genre']
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, quantity, artist_id, genre, buy_price, sell_price)
    VALUES ('#{@title}', #{@quantity}, #{@artist_id}, '#{@genre}', #{@buy_price}, #{@sell_price})
    RETURNING *;"

    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.update(options)
    sql = "UPDATE albums SET
    title='#{options['title']}',
    genre='#{options['genre']}',
    buy_price='#{options['buy_price']}',
    sell_price='#{options['sell_price']}',
    quantity='#{options['quantity']}'
    WHERE id='#{options['id']}'"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * from albums WHERE id=#{id};"
    output = SqlRunner.run(sql)
    return Album.new(output.first)

  end

  # Thought this would be better to delete album by id.  John said its not good to delete artist as then you'll get conflicts of foreign keys as album class relies on artist_id
  def self.destroy( id )
    sql = "DELETE FROM albums WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end


  def self.all
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |hash| Album.new(hash) }
  end

#have a method in here that looks at the artist id and gives back a name ie no need to have an inner join.  look at Val's Zombie bitings?
def artist_name_from_id()
  sql = 
  "SELECT * FROM artists
  WHERE id = #{@artist_id};"
  artist = SqlRunner.run(sql)
  name = artist[0]['name']
  return name
end

def profit()
  return @sell_price - @buy_price
end

def album_stock_price
  return @quantity * @buy_price
end

def stock_level()
  sql = "SELECT quantity FROM albums WHERE id = #{@id};" 
  result = SqlRunner.run(sql)
  quantity = result[0]['quantity'].to_i
  order_level = {'Low' => 5, 'Medium' => 15, 'High' => 50}
  if quantity < order_level['Low'] 
    return "Reorder Now!!"
  elsif quantity < order_level['High']
    return 'Medium'
  else return 'High'
  end
end



end