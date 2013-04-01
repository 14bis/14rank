Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :products do
    resources :reviews
  end
end
