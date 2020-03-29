class Showoff::Api::Base 

    attr_accessor :client_id, :client_secret, :headers

    
    URL = "https://showoff-rails-react-production.herokuapp.com" 
    NAMESPACED_URL = URL + "/api/v1"
    def initialize(bearer: "")
        @bearer = bearer
        @client_id = Rails.application.credentials.showoff[:client_id]
        @client_secret = Rails.application.credentials.showoff[:client_secret]
    end

    def send_request(url, body: {}, headers: {}, method: :get, params: {})
        headers = default_headers if headers.empty?
        params = default_params if params.empty?
        if method == :get
            response = RestClient.get(url, {headers: headers, params: params})
        else
            response = RestClient.send(method, url, body, headers)
        end
        return Showoff::Api::Response.new(status: :success, response: JSON.parse(response.body))
    rescue RestClient::UnprocessableEntity => e
        return Showoff::Api::Response.new(status: :error, response: JSON.parse(e.response.body))
    end
    
    private
    
    def default_body 
        @default_options ||= { 
            client_id: @client_id,
            client_secret: @client_secret
        }    
    end
    
    # The same data is used both as the default parameters for GET requests
    # and body for other requests
    # alias_method :default_params, :default_body
    alias_method :default_params, :default_body
    
    HEADERS_BASE = {
        'Content-Type': 'application/json'
    }

    def default_headers 
        @headers ||= HEADERS_BASE
        if(!@bearer.nil?)
            @headers.merge!({
                'Authorization': "Bearer #{@bearer}"
            })
        end
        @headers
    end

end