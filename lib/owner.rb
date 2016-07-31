class Owner
  attr_accessor :pets, :name
  attr_reader :species

  def self.all
    @@all
  end

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    #adds owner to all owners when initialized
    @@all << self
  end

  @@all = []

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood="happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood="happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood="happy"}
  end

  def sell_pets
    self.pets.each do |species,pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end
