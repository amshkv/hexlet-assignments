# frozen_string_literal: true

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    mapper = { '/' => 'Hello, World!', '/about' => 'About page' }

    if mapper.keys.include?(req.path)
      [200, {}, [mapper[req.path]]]
    else
      [404, {}, ['404 Not Found']]
    end
    # END
  end
end
