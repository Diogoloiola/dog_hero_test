Rails.application.routes.draw do
  resources :dog_walkings, defaults: { format: :json } do
    patch 'start_walk', on: :member
    patch 'end_walk', on: :member
  end
end
