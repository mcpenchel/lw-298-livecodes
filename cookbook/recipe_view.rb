class RecipeView

  def print_all_recipes(recipes, show_description=true)
    recipes.each_with_index do |recipe, index|
      cooked = recipe.done? ? "[X]" : "[ ]"
      string = "#{index + 1}. #{cooked} (#{recipe.prep_time}) #{recipe.name}"
      string += ": #{recipe.description}" if show_description
      puts string
    end
  end

  def ask_if_cooked_already
    puts "Did you already cook with this recipe? [Y/N]"
    gets.chomp
  end

  def ask_for_ingredient_name
    puts "What ingredient would you like a recipe for?"
    ingredient = gets.chomp
    puts "Looking for \"#{ingredient}\" on Marmiton.."
    return ingredient
  end

  def ask_for_recipe_difficulty
    ask_for_recipe_info("difficulty")
  end

  def ask_for_prep_time
    ask_for_recipe_info("preparation time")
  end

  def ask_for_recipe_name
    ask_for_recipe_info("name")
  end

  def ask_for_recipe_description
    ask_for_recipe_info("description")
  end

  def ask_for_recipe_index
    puts "What is the number of the recipe?"
    gets.chomp.to_i - 1
  end

  private
  def ask_for_recipe_info(info)
    puts "What is the new recipe #{info}?"
    gets.chomp
  end

end
