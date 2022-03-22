# frozen_string_literal: true

class GithubSearchController < ApplicationController
  def index; end

  def search
    query = params[:query]
    result = Github::Search::Repository.call(query: query)
    data = result.success? ? result.payload : { error: result.error }
    respond_to do |format|
      format.js do
        render partial: 'github_search/results', layout: false,
               locals: { success: result.success?, data: data, query: query }
      end
    end
  end
end
