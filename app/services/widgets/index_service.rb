class Widgets::IndexService
    
    def perform(token)  
        return connector(token).index
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end