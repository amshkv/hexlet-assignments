# frozen_string_literal: true

require 'rack'

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    req = Rack::Request.new(env)

    return [403, {}, ['Forbidden']] if req.path.start_with?('/admin')

    @app.call(env)
    # END
  end
end
