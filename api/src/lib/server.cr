require "kemal"
require "./init"

module Api
  extend self

  todo_repo = TodoRepository.new

  def run
    add_handler Cors.new
    Kemal.run
  end

  get "/api/v1/todos" do |env|
    result = todo_repo.all
    result.to_json
  end

  get "/api/v1/todos/:id" do |env|
    id = env.params.url["id"]
    todo = todo_repo.find(id)
    env.response.status_code = 200
    todo.to_json
  end

  post "/api/v1/todos" do |env|
    attrs = env.params.json["todo"].as(Hash)
    todo = todo_repo.create(attrs)
    env.response.status_code = 201
    {todo: todo}.to_json
  end

  put "/api/v1/todos/:id" do |env|
    id = env.params.url["id"]
    attrs = env.params.json["todo"].as(Hash)
    todo = todo_repo.update(id, attrs)
    env.response.status_code = 200
    {todo: todo}.to_json
  end

  delete "/api/v1/todos/:id" do |env|
    id = env.params.url["id"]
    todo_repo.delete(id)
    env.response.status_code = 200
  end
end
