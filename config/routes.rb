Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }
  
  
  scope module: :public do
    root to: "homes#top" 
    get 'users/:id/unsubscribe', to: 'users#unsubscribe'
    patch 'users/:id/withdrawl', to: 'users#withdrawl', as: 'withdrawl'
    resources :users, only: [:show, :edit, :update]
   
  end 
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
