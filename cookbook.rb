# requirement for file to work
require 'csv'
require_relative 'recipe'

# cookbook class
class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |recipe|
      @recipes << Recipe.new(recipe[0], recipe[1], recipe[2], recipe[3])
    end
  end

  def all
    @recipes
  end

  def update_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.level]
      end
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    update_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def done(index)
    @recipes[index].done = true
  end
end
