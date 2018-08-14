Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
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
