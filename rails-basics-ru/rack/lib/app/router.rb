# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new(env)

    if %w[/ /about].include?(req.path)
      [200, {}, { '/': 'Hello, World!', '/about': 'About page' }[req.path.to_sym]]
    else
      [404, {}, '404 Not Found']
    end
    # END
  end
end
