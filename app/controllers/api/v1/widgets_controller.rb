class Api::V1::WidgetsController < ApplicationController

    def visible
        term = params.has_key?(:term) ? params[:term] : ""
        response = api_connector_service.visible(term)
        if response.success?
            @widgets = response.body
            render_success
        else
            render_error(code: response.code, message: response.message)
        end
    end

    private

    def widgets_params
    
    end

    def api_connector_service
        @api_connector_service ||= Showoff::Api::Widgets.new(bearer: current_token)
    end
end