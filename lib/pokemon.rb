class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end
  def self.find(id, db)
    found_poke = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new({id: found_poke[0], name: found_poke[1], type: found_poke[2], hp: found_poke[3]})
  end
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id};")
    me = Pokemon.find(self.id, db)
    me
    # binding.pry
  end
end
