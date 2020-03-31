class Widgets::VisibleService
    
    def perform(term, token)  
        return connector(token).visible(term)
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end