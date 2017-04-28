Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :messages do
    resources :comments
  end

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => {:format => :json} do
    resources :messages
  end

  root 'messages#index'
end