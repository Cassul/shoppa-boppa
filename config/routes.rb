Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # to be able import files
  resources :product_variants do
    collection { post :import }
  end
end
