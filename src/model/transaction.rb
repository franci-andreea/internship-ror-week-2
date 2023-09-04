class Transaction

    attr_accessor :amount, :datetime

    def initialize(amount, datetime)
        @amount = amount
        @datetime = datetime
    end

end
