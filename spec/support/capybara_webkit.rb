Capybara::Webkit.configure do |config|
  config.raise_javascript_errors = true
  # Enable debug mode. Prints a log of everything the driver is doing.
  # config.debug = true

  # By default, requests to outside domains (anything besides localhost) will
  # result in a warning. Several methods allow you to change this behavior.

  # Silently return an empty 200 response for any requests to unknown URLs.
  config.block_unknown_urls

  # Allow pages to make requests to any URL without issuing a warning.
  # config.allow_unknown_urls

  # Allow a specific domain without issuing a warning.
  # config.allow_url("example.com")

  # Allow a specific URL and path without issuing a warning.
  # config.allow_url("example.com/some/path")

  # Wildcards are allowed in URL expressions.
  # config.allow_url("*.example.com")

  # Silently return an empty 200 response for any requests to the given URL.
  # config.block_url("example.com")

  # Timeout if requests take longer than 5 seconds
  config.timeout = 60

  # Don't raise errors when SSL certificates can't be validated
  config.ignore_ssl_errors

  # Don't load images
  config.skip_image_loading

  # Use a proxy
  #   config.use_proxy(
  #     host: "example.com",
  #     port: 1234,
  #     user: "proxy",
  #     pass: "secret"
  #   )
  # end
end

module Capybara
  module Helpers
    class << self

      alias_method :normalize_whitespace_with_warning, :normalize_whitespace

      def normalize_whitespace(*args)
        silence_warnings do
          normalize_whitespace_with_warning(*args)
        end
      end

    end
  end
end
