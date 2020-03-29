class Tokens::CreateService 


    def perform(token_params = {})
        username = token_params[:username]
        password = token_params[:password]
        response = connector.authenticate(username, password)
        return response
        # binding.pry
        # if response.success?
        #     user = User.from_email(username)
        #     token = response.body[:token]
        #     return token 
        # else 

        # end
    end


    def user 
    end


    def get_user_from_email(email)
        User.where(email: email).first_or_create do |user|
            user.email = email    
        end
    end 

    private
    # def params_for_authentication(params)
    #     params.slice(:access_token, :token_type, :expires_in, :refresh_token)
    # end
    
    def connector
        @connector ||= Showoff::Api::Authentication.new()
    end
end