# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    request = ActionDispatch::Request.new(env)
    locale = extract_locale_from_accept_language_header(request)
    I18n.locale = I18n.available_locales.include?(locale&.to_sym) ? locale : I18n.default_locale
    @app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(request)
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
  # END
end
