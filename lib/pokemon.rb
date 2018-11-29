require 'pry'
class Pokemon

	@@all = []

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id:, name:, type:, db:, hp:60)
		@id = id
		@name = name
		@type = type
		@hp = hp
		@db = db
		@@all << self
	end

	def self.save(name, type, db)
		sql = <<-SQL
		INSERT INTO pokemon (name, type)
		VALUES ("#{name}", "#{type}")
		SQL
		db.execute(sql)
	end

	def self.find(id, db)
		sql = <<-SQL
		SELECT *
		FROM pokemon
		WHERE id = "#{id}"
		SQL
		array = db.execute(sql).flatten
		Pokemon.new(id:array[0], name:array[1], type:array[2], db:db, hp:array[3])
	end

	def alter_hp(hp, db)
		sql = <<-SQL
		UPDATE pokemon
		SET hp = ?
		WHERE id = "#{self.id}"
		SQL
		db.execute(sql, hp)
		@hp = hp
	end
end
