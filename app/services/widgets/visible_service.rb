class Widgets::VisibleService
    
    def perform(token)  
        return connector(token).visible
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end