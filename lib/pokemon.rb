require 'pry'

class Pokemon


  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES ("#{name}", "#{type}")
    SQL
    db.execute(sql)
  end

  def self.find(id, db)
    new = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id}").flatten
    # binding.pry
    Pokemon.new(id: new[0], name: new[1],type: new[2], db: db)
  end

  def initialize(id:, name:, type:, hp: 60, db:) #KEYWORD ARGUMENTS ARE THIS keyword:
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  attr_accessor :id, :name, :type, :db

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end

end
