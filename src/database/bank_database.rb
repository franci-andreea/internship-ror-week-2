# a class created to simulate a bank database with user accounts, bank accounts and an ATM unit
class BankDatabase

    def initialize(users, bank_accounts, transactions, atm_unit)
        @users = users
        @bank_accounts = bank_accounts
        @transactions = transactions
        @atm_unit = atm_unit
    end

    attr_accessor :users, :bank_accounts, :transactions, :atm_unit
    
end
