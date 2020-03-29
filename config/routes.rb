Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :oauth do 
    post '/token', to: "tokens#create", as: :authenticate
    post '/revoke', to: 'tokens#revoke', as: :revoke
    post '/refresh', to: 'authentications#refresh', as: :refresh
  end



end
