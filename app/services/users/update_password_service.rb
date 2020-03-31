class Users::UpdatePasswordService

    def perform(current_password, new_password, token)
      response = connector(token).change_password(current_password, new_password)
    end
    
    private
  
    def connector(token)
      @connector ||= Showoff::Api::Users.new(bearer: token)
    end
  end