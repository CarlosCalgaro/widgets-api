class Api::V1::WidgetsController < ApplicationController

    def visible
        term = params.has_key?(:term) ? params[:term] : ""
        service = Widgets::VisibleService.new
        response = service.perform(term, current_token)
        if response.success?
            @widgets = response.body
            render_success
        else
            render_error(code: response.code, message: response.message)
        end
    end

    def create
        service = Widgets::CreateService.new
        response = service.perform(current_token, widgets_params)
        if response.success?
            @widget = response.body
            render_success
        else
            render_error(code: response.code, message: response.message)
        end
    end
    
    def index 
        service = Widgets::IndexService.new
        response = service.perform(current_token)
        if response.success?
            @widgets = response.body
            render_success
        else
            render_error(code: response.code, message: response.message)
        end
    end

    def destroy
        service = Widgets::DestroyService.new
        response = service.perform(params[:id], current_token)
        if response.success?
            @body = response.body
            render_success
        else
            render_error(code: response.code, message: response.message)
        end
    end
    
    private

    def widgets_params
        params.require(:widget).permit(:description, :name, :kind)
    end

    def api_connector_service
        @api_connector_service ||= Showoff::Api::Widgets.new(bearer: current_token)
    end
end