require_relative "router"
require_relative "recipes_controller"
require_relative "cookbook"

csv_file_path = "recipes.csv"

cookbook = Cookbook.new(csv_file_path)
controller = RecipesController.new(cookbook)
router = Router.new(controller)
router.run
