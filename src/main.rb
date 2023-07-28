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
                    # add created account to the user's bank accounts list
                    puts "Display the new bank account: [iban: #{new_bank_account.iban}, pin: #{new_bank_account.pin}, amount: #{new_bank_account.amount}]"

                    current_user.bank_accounts.push(new_bank_account)
                    break
                when "2"
                    AtmService.use_atm_machine(current_user, $bank_database.atm_unit)
                    break
                when "3"
                    UserService.view_account_details(current_user)
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
                current_user = UserService.find_by_email($bank_database.users, email)

                # display a new menu
                show_new_menu(current_user)
                break
            when "2"
                new_user = UserService.create_account($bank_database.users)
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