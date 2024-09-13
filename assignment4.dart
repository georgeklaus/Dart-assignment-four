// Encapsulation Example

class Customer {
  // Private variables
  String _name;
  double _balance;

  // Constructor to initialize customer data
  Customer(this._name, this._balance);

  // Getter method to access the private variable _name
  String get name => _name;

  // Setter method to modify the private variable _name
  set name(String newName) {
    _name = newName;
  }

  // Method to show the balance (No setter for balance, only getter)
  double get balance => _balance;

  // Method to deposit an amount into the balance
  void deposit(double amount) {
    _balance += amount;
    print('Deposit successful. New balance: \$$_balance');
  }
}

// Inheritance Example

class VIPCustomer extends Customer {
  double _discountRate;

  // Constructor that initializes both inherited and VIP-specific properties
  VIPCustomer(String name, double balance, this._discountRate) : super(name, balance);

  // Method to show discount rate for VIP customers
  void showDiscount() {
    print('Discount Rate for VIP: $_discountRate%');
  }
}

// Polymorphism Example (Method Overriding)

class RegularCustomer extends Customer {
  RegularCustomer(String name, double balance) : super(name, balance);

  // Overriding the deposit method to add a special message for regular customers
  @override
  void deposit(double amount) {
    super.deposit(amount); // Call the base class deposit method
    print('Thank you for being a regular customer.');
  }
}

// Abstract Class Example

abstract class Account {
  String accountHolder;

  // Constructor
  Account(this.accountHolder);

  // Abstract method that must be implemented by subclasses
  void accountDetails();
}

// Subclass implementing the abstract method

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(String accountHolder, this.interestRate) : super(accountHolder);

  @override
  void accountDetails() {
    print('Savings Account of $accountHolder with interest rate: $interestRate%');
  }
}

// Another subclass implementing the abstract method

class CheckingAccount extends Account {
  int transactionsPerMonth;

  CheckingAccount(String accountHolder, this.transactionsPerMonth) : super(accountHolder);

  @override
  void accountDetails() {
    print('Checking Account of $accountHolder with $transactionsPerMonth transactions allowed per month.');
  }
}

void main() {
  // Encapsulation demonstration
  Customer customer1 = Customer('Alice', 1000.0);
  print('Customer Name: ${customer1.name}');
  customer1.deposit(500);
  
  // Inheritance demonstration
  VIPCustomer vipCustomer = VIPCustomer('Bob', 2000.0, 10);
  print('VIP Customer Name: ${vipCustomer.name}');
  vipCustomer.showDiscount();
  
  // Polymorphism demonstration (Method Overriding)
  RegularCustomer regularCustomer = RegularCustomer('Charlie', 500.0);
  regularCustomer.deposit(100); // This will invoke the overridden method
  
  // Abstraction demonstration
  Account savings = SavingsAccount('Alice', 3.5);
  Account checking = CheckingAccount('Bob', 10);

  savings.accountDetails();
  checking.accountDetails();
}
