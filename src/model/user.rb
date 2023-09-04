class User

    attr_accessor :name, :job, :email, :address, :bank_accounts

    def initialize(name, job, email, address, bank_accounts)
        @name = name
        @job = job
        @email = email
        @address = address
        @bank_accounts = bank_accounts
    end

    def show_details
        puts "---------- ACCOUNT DETAILS ----------"
        puts "Name: #{@name}"
        puts "Job: #{@job}"
        puts "Email: #{@email}"
        puts "Address: #{@address}"
        puts "-------------------------------------"
    end

end
