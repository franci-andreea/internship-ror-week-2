class User

    # constructor
    def initialize(name, job, email, address)
        @name = name
        @job = job
        @email = email
        @address = address
    end

    # getters
    def name
        @name
    end

    def job
        @job
    end

    def email
        @email
    end

    def address
        @address
    end

    # setters
    def name=(name)
        @name = name
    end

    def job=(job)
        @job = job
    end

    def email=(email)
        @email = email
    end

    def address=(address)
        @address = address
    end

    # methods
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
