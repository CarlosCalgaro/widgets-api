class Showoff::Api::Authentication < Showoff::Api::Base
    
    def authenticate(username, password)
        url = "#{url()}/token"
        body = default_body.merge({
            grant_type: 'password',
            username: username,
            password: password
        })
        send_request(url, body: body, method: :post)
    end

    def revoke()
        url = "#{url()}/revoke"
        body = {
            token: @bearer
        }
        send_request(url, body: body, method: :post)
    end

    private 

    def url 
        return "#{URL}/oauth"
    end
end