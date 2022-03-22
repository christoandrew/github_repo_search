# frozen_string_literal: true

module Github
  module Connection
    BASE_URL = 'https://api.github.com'

    def connection
      headers = { "Accept": "application/vnd.github.v3+json" }

      Faraday.new(BASE_URL, headers: headers) do |f|
        f.response :json
        f.adapter :net_http
        f.response :logger, Rails.logger
        f.use :http_cache, store: Rails.cache
        f.use Faraday::Response::RaiseError
      end
    end
  end
end
