class ApplicationController < ActionController::API
    
    def render_success(status: :ok)
        @message= I18n.t("request.success")
        @code = ApiStatusCodes::SUCCESS
        render status: status
    end
    
    def render_error(status: :unprocessable_entity, message: "", code: ApiStatusCodes::ERROR)
        @message = message.blank? ? I18n.t("request.error") : message
        @code = code 
        render status: status
    end

end
