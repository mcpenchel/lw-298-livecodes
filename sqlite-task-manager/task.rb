class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes["id"]
    @title = attributes["title"]
    @description = attributes["description"]
    @done = attributes["done"]
  end

  def self.find(id)
    rows = DB.execute("SELECT * FROM tasks WHERE id = ?", id)
    Task.new(rows[0])
  end

  def save
    if !@id
      DB.execute("INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)",
                  @title, @description, @done)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ?
                  WHERE id = ?", @title, @description, @done, @id)
    end
  end

  def self.all
    tasks = DB.execute("SELECT * FROM tasks")
    tasks.map do |task|
      Task.new(task)
    end
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end
end
