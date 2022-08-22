Rails.application.routes.draw do
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  # namespace :public do
  #   get 'diagnoses/new'
  #   get 'diagnoses/index'
  # end
  # namespace :public do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :public do
  #   get 'posts/new'
  #   get 'posts/show'
  #   get 'posts/edit'
  # end
  # namespace :admin do
  #   get 'posts/index'
  #   get 'posts/show'
  #   get 'posts/edit'
  # end
  # namespace :admin do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :admin do
  #   get 'diagnoses/index'
  #   get 'diagnoses/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # devise_for :admin
  # devise_for :customer
  
  
  root to: 'public/homes#top'
  get '/about' => "public/homes#about", as: "about"
  get '/search' => "public/searches#search"

  get '/admin' => "admin/homes#top", as: "admin"
  get '/admin/search' => "admin/searches#search"


  namespace :admin do
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :favolites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
    resources :diagnoses, only: [:index, :create, :edit, :update]
  end
  



  scope module: :public do
    resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :favolites, only: [:create, :destroy]
    end
    
    resource :customers, only: [:edit, :update] do
      collection do
        get 'feed' => "customers#index"
        get 'my_page' => "customers#show"
        get 'confirm'
        patch 'withdraw'
      end
  
      # resources :フォロー機能
      
    end  
    
    resources :diagnoses, only: [:new,:index, :create]
    
  end

devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
