class Api::V1::UsersController < ApplicationController


    def index
    
    end

    def create
        user = api_connector_service.create(user_params)
        render json: user
    end

    def show 
    
    end

    private 

    def api_connector_service
        @api_connector_service ||= Showoff::Api::Users.new
    end
    
    def user_params 
        params.require(:user).permit( :first_name, :last_name, :password, :email, :image_url)
    end
end
