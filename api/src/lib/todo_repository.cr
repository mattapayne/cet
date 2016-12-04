require "./todo"
require "./db_info"
require "sqlite3"

class TodoRepository
  def initialize
  end

  def all
    result = {} of String => Array(Todo)
    todos = [] of Todo
    with_db do |db|
      db.query "SELECT rowid, title, complete FROM todos" do |rs|
        rs.each do
          todos << hydrate(rs)
        end
      end
    end
    {"todos" => todos}
  end

  def find(id)
    todo = nil
    with_db do |db|
      db.query(
        "SELECT rowid, title, complete FROM todos WHERE rowid=$1", [id]) do |rs|
        rs.each do
          todo = hydrate(rs)
        end
      end
    end
    todo
  end

  def create(attrs : Hash)
    title = attrs["title"]
    complete = attrs["complete"]
    todo_id = 0
    with_db do |db|
      result = db.exec(
        "INSERT INTO todos (rowid, title, complete) VALUES ($1, $2, $3)",
        [nil, title, complete]
      )
      todo_id = result.last_insert_id
    end
    find(todo_id)
  end

  def update(id, attrs : Hash)
    title = attrs["title"]
    complete = attrs["complete"]
    with_db do |db|
      result = db.exec(
        "UPDATE todos SET title=$1, complete=$2 WHERE rowid=$3",
        [title, complete, id]
      )
    end
    find(id)
  end

  def delete(id)
    affected = 0
    with_db do |db|
      result = db.exec("DELETE FROM todos WHERE rowid=$1", [id])
      affected = result.rows_affected
    end
    affected > 0
  end

  private def hydrate(rs)
    id = rs.read(Int32)
    title = rs.read(String)
    complete = rs.read(Int32)
    Todo.new(id, title, complete)
  end

  private def with_db
    DB.open "sqlite3:./#{DbInfo.db_name}" do |db|
      yield(db)
    end
  end
end
