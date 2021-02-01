Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do                                                      
    collection do                                                                
      post '/login', to: 'users#login'     
    end
  end
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html