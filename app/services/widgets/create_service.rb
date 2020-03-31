class Widgets::CreateService
    
    def perform(token, widgets_params = {})
        connector(token).create(widgets_params.to_h)
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end