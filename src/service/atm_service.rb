require_relative('../model/atm_unit.rb')
require_relative('./transaction_service.rb')

require 'date'

module AtmService

    WITHDRAW_LIMIT = 5000

    def AtmService.deposit_money(amount, bank_account, atm_unit)
        bank_account.amount += amount
        atm_unit.total_amount += amount
    end

    def AtmService.withdraw_money(amount, bank_account, atm_unit)
        # sort transactions by date
        TransactionService.sort_by_date(bank_account.transactions) 

        # check if there are any withdraw transactions in the last 24 hours since the current transaction
        total_withdraw = 0
        current_datetime = Time.now
        bank_account.transactions.each do |transaction|
            if ((current_datetime - transaction.datetime) / 3600).round <= 24 && transaction.amount < 0
                total_withdraw += transaction.amount
            end
        end

        if total_withdraw.abs > WITHDRAW_LIMIT
            puts "You have reached the limit of 5000$ to withdraw, return to main menu...\n"
            return
        elsif total_withdraw.abs + amount > WITHDRAW_LIMIT
            puts "The sum you want to withdraw already exceeds (considering the previous transactions) the limit of 5000$/day"
        elsif amount > WITHDRAW_LIMIT
            puts "You cannot withdraw more than 5000$ from an account/day, return to main menu...\n"
            return
        elsif amount > bank_account.amount
            puts "The amount you want to withdraw is greater that the amount you currently have in your account, return to main menu...\n"
            return
        else
            # the transaction is valid, the user can withdraw money
            bank_account.amount -= amount
            atm_unit.total_amount -= amount
        end
    end

    def AtmService.use_atm_machine(current_user, atm_unit)
        puts "---------- USE ATM MACHINE ----------"
    
        loop do
            puts "What would you like to do? Please introduce only the corresponding number of the action [1 - 2]"
    
            puts "1. Deposit money into a bank account"
            puts "2. Witdraw money from a bank account"
    
            action_choice = gets.chomp
            case action_choice
                when "1"
                    # introduce the pin of the account he wants to add money
                    print "Please introduce the pin for the account you want to deposit the money to: "
                    pin = gets.chomp
                    
                    print "Please introduce a number for the amount of money you want to deposit: "
                    amount = gets.chomp
    
                    current_user.bank_accounts.each do |bank_account|
                        if bank_account.pin == pin
                            
                            # convert amount into a number
                            amount = amount.to_f
    
                            # add money into that account
                            AtmService.deposit_money(amount, bank_account, atm_unit)
                            new_datetime = Time.now
                            new_transaction = Transaction.new(amount, new_datetime)
                            bank_account.transactions.push(new_transaction)
    
                            puts "Transaction successful!"
                            puts "Total amount on your account: #{bank_account.amount}"
                            puts "Total amount left in the ATM: #{atm_unit.total_amount}"
                            puts "Returning to main menu...\n"
    
                            return
                        end
                    end
    
                    puts "There is no account on your name with the given PIN, returning to main menu\n"
                    break
                when "2"
                    print "Please introduce the pin for the account you want to withdraw the money from: "
                    pin = gets.chomp
    
                    print "Please introduce a number for the amount of money you want to withdraw: "
                    amount = gets.chomp
    
                    current_user.bank_accounts.each do |bank_account|
    
                        if bank_account.pin == pin
                            
                            # convert amount into a number
                            amount = amount.to_f
    
                            # store the initial bank_account amount to check if the transaction was successful
                            initial_bank_account_amount = bank_account.amount
    
                            # withdraw money from that account
                            AtmService.withdraw_money(amount, bank_account, atm_unit)
    
                            if bank_account.amount != initial_bank_account_amount
                                # the transaction was possible, therefore a success, so we can add it to the list of transactions
                                new_datetime = Time.now
                                new_transaction = Transaction.new(-amount, new_datetime) # hold a negative value to differentiate from the deposit transactions
                                bank_account.transactions.push(new_transaction)
    
                                puts "Total amount on your account: #{bank_account.amount}"
                                puts "Total amount left in the ATM: #{atm_unit.total_amount}"
                                puts "Returning to main menu...\n"
    
                                return
                            end
    
                            puts "No transactions were made, return to main menu...\n"
                            return
                        end
                    end
    
                    puts "There is no account on your name with the given PIN, returning to main menu\n"
                    break
    
                else
                    puts "You did not introduce a valid number, please choose between the given options [1 - 2]"
                    next
            end
        end
    end

end
