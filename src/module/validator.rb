module Validator

    # check if the email introduced has already been used by another user
    def self.is_unique?(users, email)
        users.each do |user|
            if user.email == email
                return false
            end
        end

        return true
    end

end
