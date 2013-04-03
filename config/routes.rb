Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :products do
    resources :reviews do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
    end
  end
end
