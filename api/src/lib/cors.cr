require "kemal"

class Cors < Kemal::Handler
  def call(context)
    context.response.headers["Access-Control-Allow-Origin"] = "*"
    if context.request.method.downcase == "options"
      context.response.status_code = 200
      context.response.headers["Access-Control-Allow-Headers"] = "Content-Type,Accept"
      context.response.headers["Access-Control-Allow-Methods"] = "GET,PUT,POST,DELETE,PATCH"
      context.response.content_type = "text/html; charset=utf-8"
      response = ""
      context.response.print(response)
    else
      context.response.content_type = "application/json"
      call_next(context)
    end
  end
end
