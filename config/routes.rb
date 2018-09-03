Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

   #ActiveAdmin::Devise.config
  resources :logs
  resources :categories
  resources :books do
    resources :comments, shallow: true
    get :book_by_category  
    get :email_query  
    patch :borrow
  end

  namespace :api do
    namespace :v1 do
    resources :books do
      patch :borrow
    end
    end
  end

  #get "bookscategory", to: "books#book_by_category"
  

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
