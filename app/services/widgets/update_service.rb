class Widgets::UpdateService
    
    def perform()  
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Widgets.new(bearer: token)
    end
end