class TokensController < ApplicationController

    def create
        service = Tokens::CreateService.new
        resp = service.perform(token_params)
        @token = resp.body
        if resp.success?
            render_success
        else
            render_error(message: resp.message, code: resp.code)
        end
    end

    def revoke
        service = Tokens::RevokeService.new
        resp = service.perform(revoke_token_params[:token])
        # binding.pry
        @data = resp.body
        if resp.success?
            render_success
        else
            render_error(message: resp.message, code: resp.code)
        end
    end

    def refresh
    
    end


    def token_params 
        params.permit(:username, :password, :grant_type)
    end

    def revoke_token_params
        params.permit(:token)
    end
end
