class Users::MeService
  
  def perform(token)
    connector(token).me()
  end

  private
  def connector(token)
    @connector ||= Showoff::Api::Users.new(bearer: token)
  end
end