module Validator

    def self.is_unique?(users, email)
        users.each do |user|
            if user.email == email
                return false
            end
        end

        return true
    end

end
