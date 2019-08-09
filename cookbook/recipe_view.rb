class RecipeView

  def print_all_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
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
