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
    get 'users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/:id/withdrawl', to: 'users#withdrawl', as: 'withdrawl'
    get 'users/:id/user_post', to: 'users#user_post', as: 'user_post'
    get 'users/:id/user_fav', to: 'users#user_fav', as: 'user_fav'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :edit, :destroy]
      resource :favs, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    root to: 'homes#top'
    get 'users/:id/user_post', to: 'users#user_post', as: 'user_post'
    get 'users/:id/comments', to: 'users#user_comment', as: 'user_comment'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :categories, only: [:create, :index, :edit, :update]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
