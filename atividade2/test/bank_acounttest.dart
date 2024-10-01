import 'package:flutter_test/flutter_test.dart';
import '../lib/bank_account.dart';

void main() {
  test('Deposit test', () {
    var account = BankAccount<num>(1000);
    account.deposit(500);
    expect(account.getBalance(), 1500);
  });

  test('Withdraw test', () {
    var account = BankAccount<num>(1000);
    account.withdraw(500);
    expect(account.getBalance(), 500);
  });
}
