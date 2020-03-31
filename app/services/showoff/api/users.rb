class Showoff::Api::Users < Showoff::Api::Base

  def create(user_params = {})
      body = {
          client_id: @client_id,
          client_secret: @client_secret,
          user: user_params
      }
      return send_request(url, body: body, method: :post )
  end

  def update(user_params = {}) 
    body = {
      user: user_params
    }
    url = "#{url()}/me"
    return send_request(url, body: body, method: :put)
  end
    
  def me 
    url = "#{url()}/me"
    return send_request(url)
  end

  def find(id) 
    url = "#{url()}/#{id}"
    return send_request(url)
  end

  def my_widgets(term="")
    url = "#{url()}/me/widgets"
    params = default_params
    params[:term] = term unless term.blank?
    return send_request(url, params: params)
  end

  def change_password(current_password, new_password)
    url = "#{url()}/me/password"
    body = {
      user: {
        current_password: current_password,
        new_password: new_password
      }
    }
    return send_request(url, body: body, method: :post)
  end

  def reset_password(email)
    url = "#{url()}/reset_password"
    body = default_body.merge({
      user: {
        email: email
      }
    })
    return send_request(url, body: body, method: :post)
  end

  private

  def url 
    @url ||= "#{URL}/api/v1/users"
  end
end