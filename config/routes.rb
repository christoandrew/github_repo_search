Rails.application.routes.draw do
  root 'github_search#index'
  post 'search_repo', to:  'github_search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
