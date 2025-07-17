class Pet
  attr_reader :breed, :name

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
  
end

class Owner
  attr_reader :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  attr_reader :name

  def initialize(name="The Animal Shelter")
    @name = name
    @relationships = {}
    @inventory = []
  end

  def to_s
    @name
  end
  
  def adopt(owner, pet)
    @relationships.key?(owner) ? @relationships[owner] << pet : @relationships[owner] = [pet]
    owner.adopt(pet)
  end

  def print_adoptions
    @relationships.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each do |pet|
        puts "a #{pet.breed} named #{pet.name}"
      end
    end
  end
  
  def number_of_pets
    @inventory.size
  end

  def add_pet(pet)
    @inventory << pet
  end

  def print_inventory
    puts "#{@name} has the following unadopted pets:"
    @inventory.each do |pet|
      puts "a #{pet.breed} named #{pet.name}"
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')



phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


# Further exploration:
asta         = Pet.new('dog', 'Asta')
shelter.add_pet(asta)
shelter.print_inventory
puts "#{shelter.name} has #{shelter.number_of_pets} unadopted pets."