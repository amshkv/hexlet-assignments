# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  extend Forwardable

  attr_reader :query_params

  def initialize(url)
    @url = URI(url)
    @query_params = retrieve_query_params_from_query_string
  end

  def_delegators :@url, :scheme, :host, :to_s

  def query_param(key, default = nil)
    @memoized_params ||= {}
    @memoized_params[key] ||= query_params.fetch(key, default)
  end

  def ==(other)
    to_s == other.to_s
  end

  def equality?(other)
    [host, scheme, query_params] == [other.host, other.scheme, other.query_params]
  end

  private

  def retrieve_query_params_from_query_string
    params = @url.query
    return {} if params.nil?

    params.split('&').each_with_object({}) do |param, acc|
      key, value = param.split('=')
      acc[key.to_sym] = value
    end
  end
end
# END
