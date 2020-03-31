class Users::UpdateService
  
  def perform(token, params = {})
    response = connector(token).update(params.to_h)
  end
  
  private

  def connector(token)
    @connector ||= Showoff::Api::Users.new(bearer: token)
  end
end   