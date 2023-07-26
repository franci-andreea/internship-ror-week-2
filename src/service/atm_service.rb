require_relative('../model/atm_unit.rb')
require_relative('./transaction_service.rb')

require 'date'

module AtmService

    def AtmService.depositMoney(amount, bank_account, atm_unit)
        bank_account.amount += amount
        atm_unit.total_amount += amount
    end

    def AtmService.withdrawMoney(current_user, amount, bank_account)
        TransactionService.sortByDate(bank_account.transactions) # sort transactions by date

        # first we have to check if there are any transactions of withdraw today
        total_withdraw = 0
        current_datetime = DateTime.now.strftime("%d/%m/%Y %H:%M")
        bank_account.transactions.each do |transaction|
            if ((current_datetime - transaction.datetime) * 24 * 60 * 60).to_i < 24
                total_withdraw += 
            end
        end
    end

end