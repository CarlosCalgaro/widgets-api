class Widgets::DestroyService
    
    def perform(id, token)  
        connector(token).destroy(id)
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end