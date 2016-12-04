require "json"

class Todo
  def initialize(@id = 0, @title = "", @complete = 0)
  end

  JSON.mapping(
    id: Int32,
    title: String,
    complete: Int32
  )
end
