module TransactionService
    
    def TransactionService.sortByDate(transactions)
        transactions.sort! do |firstTransaction, secondTransaction|
            secondTransaction.datetime <=> firstTransaction.datetime
        end

        return transactions
    end
end
