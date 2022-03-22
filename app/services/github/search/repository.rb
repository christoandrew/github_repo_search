# frozen_string_literal: true

module Github
  module Search
    class Repository < BaseService
      include Github::Connection

      PATH = '/search/repositories'

      def initialize(query:)
        @query = query
      end

      def call
        find_repos
      end

      private

      def find_repos
        response = connection.get(PATH) do |req|
          req.params['q'] = @query
          req.params['per_page'] = 100
        end
      rescue Faraday::ClientError => e
        OpenStruct.new(success?: false, error: e.message)
      else
        OpenStruct.new(success?: true, payload: response.body)
      end
    end
  end
end
