class Pokemon

attr_accessor :id, :name, :type, :save, :db

@@all = []

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) Values (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    @@all.find {|pokemon_obj| pokemon_obj.id == id}
  end


end
