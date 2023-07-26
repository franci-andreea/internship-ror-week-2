class BankAccount

    # constructor
    def initialize(user, iban, pin, amount, transactions)
        @user = user
        @iban = iban
        @pin = pin
        @amount = amount
        @transactions = transactions
    end

    # getters
    def user
        @user
    end

    def iban
        @iban
    end

    def pin
        @pin
    end

    def amount
        @amount
    end

    def transactions
        @transactions
    end

    # setters
    def user=(user)
        @user = user
    end

    def iban=(iban)
        @iban = iban
    end

    def pin=(pin)
        @pin = pin
    end

    def amount=(amount)
        @amount = amount
    end

    def transactions=(transactions)
        @transactions = transactions
    end

    # methods
    public
        def show_details
            puts "---------- BANK ACCOUNT #{@iban} ----------"
            puts "Amount: #{@amount}"
            puts "-------------------------------------"
        end
end