Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


   #ActiveAdmin::Devise.config
  
  resources :book_categories
  resources :categories
  resources :comments
 
  resources :books do
    resources :comments
    get :book_by_category  
  end

  #get "bookscategory", to: "books#book_by_category"
  

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
