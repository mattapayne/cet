require "sqlite3"
require "./db_info"
require "./cors"
require "./todo"
require "./todo_repository"

DB.open "sqlite3:./#{DbInfo.db_name}" do |db|
  db.exec(%{
      CREATE TABLE IF NOT EXISTS todos (title string, complete int);
    })
end
