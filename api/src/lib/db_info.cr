module DbInfo
  extend self

  def db_name
    db_name = "todos_dev.db"
    env = ENV["KEMAL_ENV"]? || "development"
    if env == "test"
      db_name = "todos_test.db"
    end
    db_name
  end
end
