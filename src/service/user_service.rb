require_relative('../module/validator.rb')

module UserService
    
    def UserService.create_account
        puts "---------- CREATE ACCOUNT ----------"
        puts "Please introduce the following details to create your account"
    
        print "Name: "
        name = gets.chomp
        name.capitalize!
    
        print "Job: "
        job = gets.chomp
        job.capitalize!
    
        email = ""
        loop do
            print "Email: "
            email = gets.chomp
    
            if (Validator.is_unique?($bank_database.users, email))
                break
            else
                puts "This email is already used for an existing account, please introduce other address"
                next
            end
        end
    
        print "Address: "
        address = gets.chomp
    
        # format address
        words = address.split(" ")
        address = ""
        words.each do |word|
            word.capitalize!
            address = address + word + " "
        end
    
        puts "\nCreating your account..."
        new_user = User.new(name, job, email, address)
    
        puts "Successfully created your account!"
        new_user.show_details
    
        return new_user
    end

    def UserService.findByEmail(users, email)

        users.each do |user|
            if user.email == email
                return user
            end
        end

    end

end 