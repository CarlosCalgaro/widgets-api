class Users::CreateService

  def perform(params = {})
    response = connector.create(params.to_h)
  end
  
  private

  def connector
    @connector ||= Showoff::Api::Users.new
  end
end