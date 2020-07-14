class Recipe
  attr_reader :name, :description, :time, :level
  attr_accessor :done, :time, :level

  def initialize(name,description, time= "", level="")
    @name = name
    @description = description
    @time = time
    @level = level
    @done = false
  end

end
