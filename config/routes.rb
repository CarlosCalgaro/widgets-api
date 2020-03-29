Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :oauth do 
    post '/token', to: "tokens#create", as: :authenticate
    post '/revoke', to: 'tokens#revoke', as: :revoke
    post '/refresh', to: 'authentications#refresh', as: :refresh
  end


  namespace :api do 
    namespace :v1 do 
      
      scope :widgets do 
        get '/visible', to: "widgets#visible", as: :visible
      end
    end
  end

end
