require "./spec_helper"
require "../src/lib/todo"
require "../src/lib/todo_repository"

describe "Api" do
  describe "GET /api/v1/todos" do
    it "renders JSON" do
      empty_array = [] of Todo
      json_body = {"todos": empty_array}
      get "/api/v1/todos"
      response.body.should eq json_body.to_json
    end

    it "has a content type of JSON" do
      get "/api/v1/todos"
      response.content_type.should eq "application/json"
    end
  end

  describe "GET /api/v1/todos/1" do
    it "renders JSON for the Todo" do
      repo = TodoRepository.new
      todo = repo.create({"title" => "Test", "complete" => 0.to_i64})
      get "/api/v1/todos/1"
      response.body.should eq todo.to_json
    end

    it "has a content type of JSON" do
      repo = TodoRepository.new
      todo = repo.create({"title" => "Test", "complete" => 0.to_i64})
      get "/api/v1/todos/1"
      response.content_type.should eq "application/json"
    end
  end
end
