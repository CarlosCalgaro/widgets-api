class Tokens::RevokeService

    def perform(access_token)
        response = connector(access_token).revoke
        return response
    end

    private

    def connector(access_token)
        @connector ||= Showoff::Api::Authentication.new(bearer: access_token)
    end
end