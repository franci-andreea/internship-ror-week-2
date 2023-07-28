class BankAccount

    def initialize(iban, pin, amount, transactions)
        @iban = iban
        @pin = pin
        @amount = amount
        @transactions = transactions
    end

    attr_accessor :iban, :pin, :amount, :transactions

    def show_details
        puts "---------- BANK ACCOUNT #{@iban} ----------"
        puts "Amount: #{@amount}"
        puts "-------------------------------------"
    end
    
end
