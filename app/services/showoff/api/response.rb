class Showoff::Api::Response 

    attr_reader :status, :body, :message, :code

    def initialize(status:, response:)
        response = response.deep_symbolize_keys
        @code = response[:code]
        @message = response[:message]
        @body = response[:data]
        @status= status
    end

    def success?
        status == :success
    end

    def error? 
        status == :error
    end

end