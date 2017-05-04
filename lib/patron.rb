class Patron
  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

def self.all
  patrons_in_database = DB.exec("SELECT * FROM patrons;")
  all_patrons = []
  patrons_in_database.each() do |patron|
    name = patron.fetch('name')
    id = patron.fetch('id').to_i()
    each_patron = Patron.new({:name => name, :id => id})
    all_patrons.push(each_patron)
  end
  all_patrons
end


def save
  result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
end



def ==(another_patron)
  (self.name() == another_patron.name()) && (self.id() == another_patron.id())
end


def self.find(id)
  found_patron = nil
  Patron.all().each() do |patron|
    if patron.id() == id
      found_patron = patron
    end
  end
  found_patron
end

def update(attributes)
  @name = attributes.fetch(:name)
  @id = self.id()
  DB.exec("UPDATE patrons SET name = '#{@name}' WHERE id = #{@id}; ")
end

def delete
  DB.exec("DELETE FROM patrons WHERE id = #{self.id};")
end


end
