require_relative "recipe_view"
require_relative "recipe"

class RecipesController
  def initialize(cookbook)
    @cookbook = cookbook
    @view = RecipeView.new
  end

  def list
    @view.print_all_recipes(@cookbook.all)
  end

  def create
    name = @view.ask_for_recipe_name
    description = @view.ask_for_recipe_description

    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    list

    index = @view.ask_for_recipe_index
    @cookbook.remove_recipe(index)
  end
end
