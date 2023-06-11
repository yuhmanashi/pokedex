Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    get 'pokemon/types' => 'pokemon#types', :as => :pokemon_types
    
    resources :pokemon, only: [:index, :show, :create, :update] do
      resources :items, shallow: true, only: [:index, :create, :update, :destroy]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
