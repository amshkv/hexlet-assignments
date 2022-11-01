# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    prev_time = Time.now
    status, headers, body = @app.call(env)
    time_in_miliseconds = ((Time.now - prev_time) * 1000).ceil

    [status, headers, body.concat(["Execution time: #{time_in_miliseconds}ms"])]
  end
end
