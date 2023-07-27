require_relative('../model/atm_unit.rb')
require_relative('./transaction_service.rb')

require 'date'

module AtmService

    def AtmService.depositMoney(amount, bank_account, atm_unit)
        bank_account.amount += amount
        atm_unit.total_amount += amount
    end

    def AtmService.withdrawMoney(amount, bank_account, atm_unit)
        # sort transactions by date
        TransactionService.sortByDate(bank_account.transactions) 

        # check if there are any withdraw transactions in the last 24 hours since the current transaction
        total_withdraw = 0
        current_datetime = Time.now
        bank_account.transactions.each do |transaction|
            if ((current_datetime - transaction.datetime) / 3600).round <= 24 && transaction.amount < 0
                total_withdraw += transaction.amount
            end
        end

        if total_withdraw.abs > 5000
            puts "You have reached the limit of 5000$ to withdraw, return to main menu..."
            return
        elsif total_withdraw.abs + amount > 5000
            puts "The sum you want to withdraw already exceeds (considering the previous transactions) the limit of 5000$/day"
        elsif amount > 5000
            puts "You cannot withdraw more than 5000$ from an account/day, return to main menu..."
            return
        elsif amount > bank_account.amount
            puts "The amount you want to withdraw is greater that the amount you currently have in your account, return to main menu..."
            return
        else
            # the transaction is valid, the user can withdraw money
            bank_account.amount -= amount
            atm_unit.total_amount -= amount
        end
    end

end
