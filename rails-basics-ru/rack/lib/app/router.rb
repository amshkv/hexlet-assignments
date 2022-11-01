# frozen_string_literal: true

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    routes = { '/' => 'Hello, World!', '/about' => 'About page' }

    if routes.keys.include?(req.path)
      [200, {}, [routes[req.path]]]
    else
      [404, {}, ['404 Not Found']]
    end
    # END
  end
end
