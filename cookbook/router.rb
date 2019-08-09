class Router

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "------ Welcome to the Ultimate Cookbook ------"
    puts "----------------------------------------------"

    while @running
      user_action = display_user_actions_and_ask
      dispatch_action_to_controller(user_action)
    end
  end

  private
  def display_user_actions_and_ask
    puts "What do you want to do?"
    puts "1. List all recipes"
    puts "2. Create a new recipe"
    puts "3. Remove a recipe"
    puts "4. Quit the application"
    gets.chomp
  end

  def dispatch_action_to_controller(user_action)
    case user_action
    when "1"
      @controller.list
    when "2"
      @controller.create
    when "3"
      @controller.destroy
    when "4"
      @running = false
    else
      puts "Invalid action number, please try again."
    end
  end

end
