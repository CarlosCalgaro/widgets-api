class Users::ResetPasswordService

    def perform(email)
      response = connector.reset_password(email)
    end
    
    private
  
    def connector
      @connector ||= Showoff::Api::Users.new()
    end
  end