require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index_recipe)
    @recipes.delete_at(index_recipe)
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      name = row[0] # String
      description = row[1] # String
      @recipes << Recipe.new(name, description)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end