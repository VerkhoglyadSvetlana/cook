Rails.application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :users, only: [:show]
  resources :books, :interests, :authors, :publishers, :comments

  resources :comments, only: [:new, :create, :edit, :update, :destroy]

  resources :books do
    resources :interests, only: [:new]
  end

  resources :interests do
    resources :comments, only: [:new]
  end

 
end
