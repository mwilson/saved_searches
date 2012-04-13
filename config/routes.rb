Rails.application.routes.draw do

  resources :saved_searches do
    collection do
      get 'query_model'
      get 'query_model_by_form'
      post 'query_model_by_form'
      get 'render_table'
    end
  end

end
