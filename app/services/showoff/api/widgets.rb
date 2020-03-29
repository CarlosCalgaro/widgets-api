class Showoff::Api::Widgets < Showoff::Api::Base

  def visible(term = "")
    url = "#{url()}/visible"
    params = default_params
    params[:term] = term unless term.blank?
    return send_request(url, headers: default_headers, params: params)
  end

  private 

  def url 
    @url ||= "#{NAMESPACED_URL}/widgets"
  end
end