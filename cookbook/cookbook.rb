require 'csv'

CSV_OPTIONS = { col_sep: ',', force_quotes: true, quote_char: '"' }

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    CSV.foreach(csv_file_path) do |row|
      done = row[3] == "true" ? true : false
      @recipes << Recipe.new(row[0], row[1], row[2], row[4], done)
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe

    CSV.open(@csv_file_path, 'a', CSV_OPTIONS) do |csv|
      csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?, recipe.difficulty]
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    persist_all_recipes!
  end

  def mark_recipe_as_done_at(index)
    @recipes[index].done = true
    persist_all_recipes!
  end

  private
  def persist_all_recipes!
    CSV.open(@csv_file_path, 'wb', CSV_OPTIONS) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?, recipe.difficulty]
      end
    end
  end

end
