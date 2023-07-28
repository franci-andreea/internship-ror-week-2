class User

    def initialize(name, job, email, address, bank_accounts)
        @name = name
        @job = job
        @email = email
        @address = address
        @bank_accounts = bank_accounts
    end

    attr_accessor :name, :job, :email, :address, :bank_accounts

    public
        def show_details
            puts "---------- ACCOUNT DETAILS ----------"
            puts "Name: #{@name}"
            puts "Job: #{@job}"
            puts "Email: #{@email}"
            puts "Address: #{@address}"
            puts "-------------------------------------"
        end

end
