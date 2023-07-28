class Transaction

    def initialize(amount, datetime)
        @amount = amount
        @datetime = datetime
    end

    attr_accessor :amount, :datetime

end
