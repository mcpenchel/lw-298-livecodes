require 'csv'

CSV_OPTIONS = { col_sep: ',', force_quotes: true, quote_char: '"' }

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    CSV.foreach(csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe

    CSV.open(@csv_file_path, 'a', CSV_OPTIONS) do |csv|
      csv << [recipe.name, recipe.description]
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)

    CSV.open(@csv_file_path, 'wb', CSV_OPTIONS) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
