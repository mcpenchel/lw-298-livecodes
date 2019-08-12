require_relative "recipe_view"
require_relative "recipe"
require "nokogiri"
require "open-uri"
require "pry-byebug"

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
    prep_time = @view.ask_for_prep_time
    done = @view.ask_if_cooked_already.upcase == "Y" ? true : false
    difficulty = @view.ask_for_recipe_difficulty

    new_recipe = Recipe.new(name, description, prep_time, difficulty, done)
    @cookbook.add_recipe(new_recipe)
  end

  def update
    @view.print_all_recipes(@cookbook.all, false)
    index = @view.ask_for_recipe_index

    @cookbook.mark_recipe_as_done_at(index)
  end

  def destroy
    list

    index = @view.ask_for_recipe_index
    @cookbook.remove_recipe(index)
  end

  def search
    ingredient = @view.ask_for_ingredient_name

    url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    recipes = []

    html_doc.search('.recipe-card')[0..4].each_with_index do |element, index|
      name = element.search('.recipe-card__title').first.text.strip
      description = element.search('.recipe-card__description').first.text.strip
      prep_time = element.search('.recipe-card__duration__value')
      prep_time = prep_time.empty? ? "No idea" : prep_time.first.text.strip
      href = element.search('.recipe-card-link').first.attribute('href').value

      recipes << [name, description, prep_time, href]
    end

    recipes_objects = recipes.map do |recipe|
      Recipe.new(recipe[0], recipe[1], recipe[2], "")
    end

    @view.print_all_recipes(recipes_objects, false)

    index = @view.ask_for_recipe_index

    if recipes[index][3][0..2] == "htt"
      url = recipes[index][3]
    else
      url = "https://www.marmiton.org#{recipes[index][3]}"
    end

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    difficulty = html_doc.search('.recipe-infos__item-title')[2].text.strip

    recipe_a = recipes[index]
    recipe = Recipe.new(recipe_a[0], recipe_a[1], recipe_a[2], difficulty)

    @cookbook.add_recipe(recipe)
  end
end
