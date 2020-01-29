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

## Class/Method structure

The account class updates the balance after transactions have been made.

| Objects | Methods |
| --- | --- |
| account | update_balance |
| | display_balance |

The transaction_history class stores the transactions that have been made.

| Objects | Methods |
| --- | --- |
| transaction_history | add_transaction |
| | transaction_to_statement |

The amount, time and action is held in this transaction class.

| Objects | Methods |
| --- | --- |
| transaction | |

The system class displays the information onto the command line.

| Objects | Methods |
| --- | --- |
| system | print_recent_history |


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
