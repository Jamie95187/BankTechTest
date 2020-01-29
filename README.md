# Bank Tech Test

## Overview

A program ran in terminal which can be run in a ruby REPL such as irb in terminal. Users can display their transaction history after making deposits or withdrawals from their accounts.

## Installation

Clone the repository and install the gems as follows:

```
git clone https://github.com/Jamie95187/BankTechTest.git
bundle install
```

## Testing

The testing framework used in this project is rspec and for the test coverage the simpleCov gem was implemented. Rubocop was the chosen linter. These can be ran in the projects root directory, as follows:

```
rspec
rubocop
```

A test coverage of 100% was maintained throughout this project, all tests should be passing and there should be 0 offences when `rubocop` is ran.

## Approach

I decided to have four classes for this project and followed the TDD pattern of **red, green, refactor**. I began by creating tests for the important features, which was displaying a statement in the command line. I later considered some edge cases such as a wrong action given in as an argument, for example neither 'withdraw' or 'deposit'. I made the assumption that a user will not be able to go into an overdraft and they will not be able to go into a negative balance.

## Class/Method structure

The account class updates the balance after transactions have been made.

| Objects | Methods |
| --- | --- |
| Account | update_balance |
| | display_balance |

The transaction_history class stores the transactions that have been made.

| Objects | Methods |
| --- | --- |
| TransactionHistory | add_transaction |
| | transaction_to_statement |

The amount, time and action is held in this transaction class.

| Objects | Methods |
| --- | --- |
| Transaction | |

The system class displays the information onto the command line.

| Objects | Methods |
| --- | --- |
| BankSystem | print_recent_history |

## Running the program

Go to the root directory and open `irb` in terminal. Load the files into the environment. You can load the files in by typing `irb -r './lib/bank'` at the root directory, or you can load the file in the `irb` environment by typing `require_relative './lib/bank'`. The program can be ran as follows:

```
2.6.5 :001 > banksystem = BankSystem.new
 => #<BankSystem:0x00007faddfa73890 @transaction_class=Transaction>
2.6.5 :002 > account = Account.new
 => #<Account:0x00007faddfa70410 @balance=0>
2.6.5 :003 > transaction_history = TransactionHistory.new(account)
 => #<TransactionHistory:0x00007faddfa639b8 @account=#<Account:0x00007faddfa70410 @balance=0>, @log=[]>
2.6.5 :004 > banksystem.process('deposit', 1000, transaction_history)
 => #<Transaction:0x00007faddfa5a5c0 @action="deposit", @time="29/01/2020", @amount=1000>
2.6.5 :005 > banksystem.process('withdraw', 500, transaction_history)
 => #<Transaction:0x00007faddfa50e30 @action="withdraw", @time="29/01/2020", @amount=500>
2.6.5 :006 > banksystem.print_statement(transaction_history)
date || credit || debit || balance
29/01/2020 || || 500.00 || 500.00
29/01/2020 || 1000.00 || || 1000.00
```

## User Stories

```
As a user,
so that I can indulge on food
I would like to withdraw money from my account

As a user,
so that I can keep buying delicious food
I would like to deposit money into my account

As a user,
so that I can work out how much food I can buy
I would like to see how much balance I have in my account

As a user,
so that I can be sulk at my food expenditure
I would like to see a number of my most recent transactions

As a user,
so that I won't have troubles with my finances
I would like to be stopped from going into an overdraft
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
