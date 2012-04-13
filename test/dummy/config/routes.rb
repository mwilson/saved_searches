Rails.application.routes.draw do

  mount SavedSearches::Engine => "/saved_searches"
end
