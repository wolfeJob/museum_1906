require 'pry'
class Museum
attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    #coulndt stop getting nil. Yikes. 
    @exhibits.find_all{|x| x.name == patron.interests[0] || patron.interests[1]}
  end
  end
