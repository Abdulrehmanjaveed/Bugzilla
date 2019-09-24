Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    member do
      resources :project_users
    end
    resources :bugs do
      member do
        patch 'assign_bug'
      end
    end
  end
  root to: redirect('/users/sign_in')
  #root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
