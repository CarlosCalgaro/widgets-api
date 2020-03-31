Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :oauth do 
    post '/token', to: "tokens#create", as: :authenticate
    post '/revoke', to: 'tokens#revoke', as: :revoke
    post '/refresh', to: 'authentications#refresh', as: :refresh
  end


  namespace :api do 
    namespace :v1 do 

      resources :users, only: [:show, :create] do
        collection do 
          post '/reset_password', to: 'users#reset_password', as: :reset_password
          get  '/me', to: 'users#me', as: :me
          put  '/me', to: 'users#update', as: :update
          post '/me/password', to: 'users#update_password', as: :update_password
          get  '/me/widgets', to: 'users#widgets', as: :widget
        end
      end
      
      scope :widgets do 
        get '/', to: "widgets#index", as: :index
        get '/visible', to: "widgets#visible", as: :visible
        post '/', to: 'widgets#create', as: :create
        delete '/:id', to: 'widgets#destroy', as: :destroy
        put '/:id', to: 'widgets#update', as: :update
      end
    end
  end

end
