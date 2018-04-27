Rails.application.routes.draw do
  resources :users do
    collection { post :import }
  end
  
  root 'welcome#index'
end
