class BankAccount<T extends num> {
  T balance;

  BankAccount(this.balance);

  void deposit(T amount) {
    if (amount != null) {
      balance = (balance + amount) as T; 
    }
  }

  void withdraw(T amount) {
    if (amount != null && balance >= amount) {
      balance = (balance - amount) as T;
    }
  }

  T getBalance() {
    return balance;
  }
}
