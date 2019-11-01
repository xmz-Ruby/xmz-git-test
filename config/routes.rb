Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  delete '/articles/:id', to: 'articles#destroy', as: 'delete_article'
  resources :articles do
    resources :comments
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
