require_relative('../database/bank_database.rb')

module DatabasePopulateService

    def self.call
        users = []
        bank_accounts = []
        transactions = []
    
        # users
        user1 = User.new("Francesca Ditulescu", "intern", "franci@gmail.com", "Cluj-napoca, cluj", [])
        user2 = User.new("Ionel Popescu", "doctor", "ion.pop@doc.com", "salaj zalau", [])
        user3 = User.new("adela lowercase", "job", "add@ela.com", "locatie secreta", [])
        user4 = User.new("Boca georgel", "instalator", "boc_george@email.com", "timis, timisoara", [])
    
        users.push(user1)
        users.push(user2)
        users.push(user3)
        users.push(user4)
        
        # bank accounts
        bank_account1 = BankAccount.new("RO76RZBR9867674457156698", "1023", 4550.00, [])
        bank_account2 = BankAccount.new("RO23RZBR8363537684556816", "8966", 9400.00, [])
        bank_account3 = BankAccount.new("RO29RZBR5565146558866661", "7841", 11.00, [])
        bank_account4 = BankAccount.new("RO16RZBR1927156474291795", "0023", 24000.00, [])
        bank_account5 = BankAccount.new("RO12RZBR3145981636483238", "0698", 2001.00, [])
        bank_account6 = BankAccount.new("RO10RZBR2123915386647643", "3358", 4999.99, [])
        bank_account7 = BankAccount.new("RO59RZBR8577628785627917", "7963", 90.00, [])
    
        user1.bank_accounts.push(bank_account1)
        user1.bank_accounts.push(bank_account2)
        user2.bank_accounts.push(bank_account3)
        user3.bank_accounts.push(bank_account4)
        user3.bank_accounts.push(bank_account5)
        user3.bank_accounts.push(bank_account6)
        user4.bank_accounts.push(bank_account7)
    
        # atm_units
        atm_unit = AtmUnit.new(110000)
    
        return BankDatabase.new(users, bank_accounts, transactions, atm_unit)
    end

end
