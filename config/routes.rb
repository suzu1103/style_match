Rails.application.routes.draw do
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

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
      resources :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
    resources :diagnoses, only: [:index, :create, :edit, :update]
  end




  scope module: :public do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :customers, only: [:show, :edit, :update] do
      collection do
        # get 'my_page'
        get 'confirm'
        patch 'withdraw'
      end
      resource :follow_relations, only: [:create, :destroy]
        get 'followed' => 'follow_relations#followed', as: 'followed'
        get 'follower' => 'follow_relations#follower', as: 'follower'
        post 'follow/:id' => 'follow_relations#follow', as: 'follow'
        post 'unfollow/:id' => 'follow_relations#unfollow', as: 'unfollow'      
    end



    # follow_relations
    # post 'follow/:id' => 'follow_relations#follow', as: 'follow'
    # post 'unfollow/:id' => 'follow_relations#unfollow', as: 'unfollow'

    resources :diagnoses, only: [:new,:index, :create]

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
