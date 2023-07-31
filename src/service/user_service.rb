require_relative('../module/validator.rb')

module UserService
    
    def UserService.create_account(users)
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
    
            if (Validator.is_unique?(users, email))
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
        new_user = User.new(name, job, email, address, [])
    
        puts "Successfully created your account!"
        new_user.show_details
    
        return new_user
    end

    def UserService.find_by_email(users, email)
        users.each do |user|
            if user.email == email
                return user
            end
        end

        return nil
    end

    def UserService.view_account_details(current_user)
        puts "---------- VIEW ACCOUNT DETAILS ----------"
        puts "For user #{current_user.name}"
    
        current_user.bank_accounts.each do |bank_account|
                bank_account.show_details
        end
    end

end 
