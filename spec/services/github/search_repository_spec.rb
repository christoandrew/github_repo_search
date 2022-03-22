# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts/github_mock_api'

RSpec.describe Github::Search::Repository do
  include_context "github_mock_api"

  it 'handles 422' do
    expect(subject.call(query: '')).to_not be_success
  end

  it 'returns correct results for proper request' do
    result = subject.call(query: 'ruby')
    expect(result).to be_success
    expect(result.payload["total_count"]).to eq 367386
    expect(result.payload["items"].count).to eq 10
  end
end
