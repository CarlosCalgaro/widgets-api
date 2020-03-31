class User < ApplicationRecord
    

    # This method creates users if they dont exists
    # because a user should be able do log in without
    # registering first(because the users comes from the API)
    def self.from_email(email)
        User.where(email: email).first_or_create do |user|
            user.email = email
        end
    end

end
