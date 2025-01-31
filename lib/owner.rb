require 'pry'
class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
 
  def dogs
    Dog.all.select do |dog|
        dog.owner == self
    end
  end


  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end 

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

def sell_pets
  self.cats.each do |cat|
    cat.owner = nil
    cat.mood = "nervous"
  end
  self.dogs.each do |dog|
    dog.owner = nil
    dog.mood = "nervous"
  end
end


  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end
  

  def self.reset_all
    @@all.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end