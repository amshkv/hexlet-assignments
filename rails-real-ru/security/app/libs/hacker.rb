# frozen_string_literal: true

require 'open-uri'
require 'net/http'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      uri = URI.join(hostname, '/users/sign_up')
      response = get_response(uri)
      html = Nokogiri::HTML(response.body)

      authenticity_token = get_authenticity_token(html)
      cookie = get_cookie(response)

      params = set_params(email, password, authenticity_token)

      form_uri = URI.join(hostname, '/users')
      request(form_uri, params, cookie)
    end

    def hostname
      'https://rails-collective-blog-ru.hexlet.app/'
    end

    def get_response(url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new uri

      http.request request
    end

    def get_cookie(response)
      response.response['set-cookie'].split('; ')[0]
    end

    def get_authenticity_token(html)
      authenticity_token_tag = html.at('input[name="authenticity_token"]')
      authenticity_token_tag['value']
    end

    def set_params(email, password, token)
      {
        authenticity_token: token,
        user: {
            email: email,
            password: password,
            password_confirmation: password
        }
      }
    end

    def request(uri, params, cookie)
      request = Net::HTTP::Post.new uri
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      http.request request
    end
    # END
  end
end
