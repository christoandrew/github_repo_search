require 'rails_helper'

RSpec.feature "Repository searching", type: :feature, js: true do
  include_context "github_mock_api"

  scenario 'user fills and submits valid form return correct results' do
    visit root_path
    expect(page).to have_content "Github Repo Search"
    expect(page).to have_content "Github Repository Finder"

    fill_in "Repository", with: "ruby"
    click_button "Search"
    expect(page).to have_content "Showing results for ruby"
    expect(page).to have_content "ruby/ruby"
    expect(page).to have_content "airbnb/ruby"
  end
end
