class Users::FindService
  
    def perform(id, token)
      connector(token).find(id)
    end
  
    private
    def connector(token)
      @connector ||= Showoff::Api::Users.new(bearer: token)
    end
  end