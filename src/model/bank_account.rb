class BankAccount

    attr_accessor :iban, :pin, :amount, :transactions

    def initialize(iban, pin, amount, transactions)
        @iban = iban
        @pin = pin
        @amount = amount
        @transactions = transactions
    end

    def show_details
        puts "---------- BANK ACCOUNT #{@iban} ----------"
        puts "Amount: #{@amount}"
        puts "-------------------------------------"
    end
    
end
