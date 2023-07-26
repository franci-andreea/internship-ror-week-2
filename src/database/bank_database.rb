# a class created to simulate a bank database with user accounts, bank accounts and an ATM unit

class BankDatabase

    # constructor
    def initialize(users, bank_accounts, transactions, atm_unit)
        @users = users
        @bank_accounts = bank_accounts
        @transactions = transactions
        @atm_unit = atm_unit
    end

    # getters
    def users
        @users
    end

    def bank_accounts
        @bank_accounts
    end

    def transactions
        @transactions
    end

    def atm_unit
        @atm_unit
    end

    # setters
    def users=(users)
        @users = users
    end

    def bank_accounts=(bank_accounts)
        @bank_accounts = bank_accounts
    end

    def transactions=(transactions)
        @transactions = transactions
    end

    def atm_unit=(atm_unit)
        @atm_unit = atm_unit
    end
    
end