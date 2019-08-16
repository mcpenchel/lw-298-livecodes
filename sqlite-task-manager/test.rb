require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

DB.execute("DELETE FROM tasks WHERE id > 1");

# READ logic to find a given task (by its id)
puts Task.find(1).class == Task
puts Task.find(1).id == 1

# CREATE logic in a save instance method
task = Task.new(title: "Sleep early", description: "We are all tired", done: 0)
puts task.id == nil
task.save
puts task.id
puts task.id == DB.last_insert_row_id

# UPDATE logic in the same method
task.title = "Sleep late"
task.description = "We want to partyyyyyy"
task.save
puts task.title == "Sleep late"
puts task.description == "We want to partyyyyyy"

# READ logic to retrieve all tasks (what type of method is it?)
puts Task.all.length == 2
puts Task.all.first.class == Task
puts Task.all.last.class == Task

# DESTROY logic on a task
task.destroy
puts Task.all.length == 1
puts Task.all.first.id == 1
