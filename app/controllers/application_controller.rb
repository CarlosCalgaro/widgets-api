class ApplicationController < ActionController::API
    
    private
    def render_success(message: "", status: :ok)
        @message = message.blank? ? I18n.t("request.success") : message
        @code = ApiStatusCodes::SUCCESS
        render status: status
    end
    
    def render_error(status: :unprocessable_entity, message: "", code: ApiStatusCodes::ERROR)
        @message = message.blank? ? I18n.t("request.error") : message
        @code = code 
        render status: status
    end

    def current_token
        return "" if !request.headers['Authorization'].present?
        return request.headers['Authorization'].split(' ').last
    end
end
