Rails.application.routes.draw do
  root 'products#index'
  post 'seed', to: 'application#seed', as: :seed

  resources :products, only: [:index, :show, :new, :create], param: :name do
    member do
      post 'gift', to: 'products#send_gift'
    end
  end
end
