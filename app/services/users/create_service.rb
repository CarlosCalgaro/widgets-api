class Users::CreateService

  def perform(params = {})
    response = connector.create(params)
    
    
  end
  
  private

  def connector
    @connector ||= Showoff::Api::Users.new
  end
end