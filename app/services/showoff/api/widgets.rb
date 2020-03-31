class Showoff::Api::Widgets < Showoff::Api::Base

  def visible(term = "")
    url = "#{url()}/visible"
    params = default_params
    params[:term] = term unless term.blank?
    return send_request(url, params: params)
  end

  def index()
    params = default_params
    return send_request(url, params: params)
  end

  def create(params)
    body = {
      widget: params
    }
    return send_request(url, body: body, method: :post)
  end
  
  def destroy(id)
    url = "#{url()}/#{id}"
    return send_request(url, method: :delete)
  end
  
  private 

  def url 
    @url ||= "#{NAMESPACED_URL}/widgets"
  end
end