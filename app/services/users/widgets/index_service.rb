class Users::Widgets::IndexService
    
    def perform(term, token)  
        return connector(token).my_widgets(term)
    end

    private

    def connector(token)
        @connector ||= Showoff::Api::Users.new(bearer: token)
    end
end