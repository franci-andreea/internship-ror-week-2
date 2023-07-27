require_relative('../src/database/bank_database.rb')
require_relative('../src/model/user.rb')
require_relative('../src/model/bank_account.rb')
require_relative('../src/model/transaction.rb')
require_relative('../src/model/atm_unit.rb')
require_relative('../src/module/validator.rb')
require_relative('../src/module/populate.rb')
require_relative('../src/service/user_service.rb')
require_relative('../src/service/bank_account_service.rb')
require_relative('../src/service/atm_service.rb')

require 'date'
require 'time'

$bank_database

def show_new_menu(current_user)
    loop do
        puts "What would you like to do? Please introduce only the corresponding number of the action [1 - 4]"

        puts "1. Create Bank Account"
        puts "2. Use ATM machine"
        puts "3. View account details"
        puts "4. Exit"

        loop do
            action_choice = gets.chomp
            case action_choice
                when "1"
                    new_bank_account = BankAccountService.create_bank_account(current_user)
                    # add created account to the bank database
                    puts "display the new bank account: [iban: #{new_bank_account.iban}, pin: #{new_bank_account.pin}, amount: #{new_bank_account.amount}]"

                    $bank_database.bank_accounts.push(new_bank_account)
                    break
                when "2"
                    use_atm_machine(current_user)
                    break
                when "3"
                    view_account_details(current_user)
                    break
                when "4"
                    puts "You have selected option 4 (Exit the application).\nThank you and have a great day!"
                    return
                else
                    puts "You did not introduce a valid number, please choose between the given options [1 - 4]"
                    next
            end
        end

        next
    end
end

def use_atm_machine(current_user)
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

                $bank_database.bank_accounts.each do |bank_account|
                    if bank_account.user == current_user && bank_account.pin == pin
                        
                        # convert amount into a number
                        amount = amount.to_f

                        # add money into that account
                        AtmService.depositMoney(amount, bank_account, $bank_database.atm_unit)
                        new_datetime = Time.now
                        new_transaction = Transaction.new(amount, new_datetime)
                        bank_account.transactions.push(new_transaction)

                        puts "Transaction successful!"
                        puts "Total amount on your account: #{bank_account.amount}"
                        puts "Total amount left in the ATM: #{$bank_database.atm_unit.total_amount}"
                        puts "Returning to main menu...\n"

                        return
                    end
                end

                puts "There is no account on your name with the given PIN, returning to main menu\n"
                break
            when "2"
                print "Please introduce the pin for the account you want to withdraw the money to: "
                pin = gets.chomp

                print "Please introduce a number for the amount of money you want to withdraw: "
                amount = gets.chomp

                $bank_database.bank_accounts.each do |bank_account|

                    if bank_account.user == current_user && bank_account.pin == pin
                        
                        # convert amount into a number
                        amount = amount.to_f

                        # store the initial bank_account amount to check if the transaction was successful
                        initial_bank_account_amount = bank_account.amount

                        # withdraw money from that account
                        AtmService.withdrawMoney(amount, bank_account, $bank_database.atm_unit)

                        if bank_account.amount != initial_bank_account_amount
                            # the transaction was possible, therefore a success, so we can add it to the list of transactions
                            new_datetime = Time.now
                            new_transaction = Transaction.new(-amount, new_datetime) # hold a negative value to differentiate from the deposit transactions
                            bank_account.transactions.push(new_transaction)

                            puts "Total amount on your account: #{bank_account.amount}"
                            puts "Total amount left in the ATM: #{$bank_database.atm_unit.total_amount}"
                            puts "Returning to main menu...\n"

                            return
                        end

                        puts "No transactions were made, return to main menu..."
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

def view_account_details(current_user)
    puts "---------- VIEW ACCOUNT DETAILS ----------"
    puts "For user #{current_user.name}"

    $bank_database.bank_accounts.each do |bank_account|
        if bank_account.user == current_user
            bank_account.show_details
        end
    end
end

def main
    puts "\nWelcome to Awooo Bank Application!\n"

    puts "Initializing application..."
    # create users, bank accounts and an ATM machine to add to the bank database
    $bank_database = Populate.populate_database
    puts "Intialization successful!"

    loop do
        puts "Do you have an account? Please introduce only the corresponding number of the action [1 - 2]"
        puts "1. Yes\n2. No"
        has_account = gets.chomp

        case has_account
            when "1"
                puts "Please introduce your email address to log into your account"
                print "Email: "
                email = gets.chomp

                if Validator.is_unique?($bank_database.users, email)
                    "There is no account with this email address."
                    next
                end
                
                # get the current user object
                current_user = UserService.findByEmail($bank_database.users, email)

                # display a new menu
                show_new_menu(current_user)
                break
            when "2"
                new_user = UserService.create_account
                $bank_database.users.push(new_user)

                # created the user, redirect him to the new menu
                show_new_menu(new_user)
                break
            else
                puts "You did not introduce a valid number, please choose between the given options [1 - 2]"
                next
        end
    end
end

main