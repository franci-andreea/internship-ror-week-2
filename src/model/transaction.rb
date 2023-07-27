class Transaction

    # constructor
    def initialize(amount, datetime)
        @amount = amount
        @datetime = datetime
    end

    # getters 
    def amount
        @amount
    end

    def datetime
        @datetime
    end

    # setters

    def amount=(amount)
        @amount = amount
    end

    def datetime=(datetime)
        @datetime = datetime
    end

end
