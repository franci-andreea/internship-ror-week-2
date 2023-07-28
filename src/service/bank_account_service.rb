module BankAccountService

    def BankAccountService.generate_iban
        iban_list = [
            "RO12RZBR2469124176164194",
            "RO85PORL3241441653915515",
            "RO58PORL3286392456491996",
            "RO96RZBR4516854115771934",
            "RO64PORL6341836799997467",
            "RO45PORL8645662555117173",
            "RO55RZBR6819876182279672",
            "RO54RZBR9675956985522993",
            "RO10RZBR1428837115951352",
            "RO60RZBR5549466623454143",
            "RO62RZBR3884459186499924"
        ]

        return iban_list.at(rand(0..10))
    end

    def BankAccountService.create_bank_account(current_user)
        puts "---------- CREATE BANK ACCOUNT ----------"
        print "Please insert the PIN you want to have on this account: "
        pin = gets.chomp
    
        puts "Generating IBAN for your account..."
        # generate IBAN number
        iban = BankAccountService.generate_iban
    
        puts "IBAN Generated: #{iban}"
    
        # set initial amount of money to 0
        amount = 0.00
        
        puts "Bank account created successfully, returning to the main menu\n"

        return BankAccount.new(current_user, iban, pin, amount, [])
    end

end
