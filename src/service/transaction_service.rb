module TransactionService
    
    def self.sort_by_date(transactions)
        transactions.sort! do |firstTransaction, secondTransaction|
            secondTransaction.datetime <=> firstTransaction.datetime
        end

        return transactions
    end
end
