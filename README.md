# Ruby on Rails Internship Assignment 2 - Bank ATMs Management Service

## Requirements
- users can create an account to the bank using their personal details: name, job, email & address.
- users can retrieve or deposit money into their account.
- each user can deposit an unlimited amount of money, but only retrieve 5.000$ per day
- check if the user wants to withdraw more than the current amount in his account.

## Implementation
For this assignment, no database was used to store the users, their accounts and the ATM units. Instead, I have created a module which simulates a database and creates a few users with some bank accounts. I have defined a BankDatabase class which holds the following: a list of users, a list of bank accounts, a list of transactions and ATM unit.

The models implemented are:
- `User` - normal user (client)
- `BankAccount` - holds the bank account details such as IBAN, pin, account amount and the transactions perfomed on this account
- `Transaction` - holds information regarding an ATM transaction such as the amount transfered and the moment it was completed.
- `AtmUnit` - just to simulate an ATM unit which contains a given amount (just like an ATM in real life which has a specific number of each banknote)

The application is meant to be run in one instance and is based on action choices (by choosing number 1, 2, 3 and so on). There are services created to handle each action choice.

## Difficulties / Blockers
- getting familiar with Ruby syntax (especially not placing a semicolon)

## What have I learned?
- how to work with classes and modules in Ruby
- how to write tests in RSPEC
