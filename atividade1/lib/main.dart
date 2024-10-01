import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicação Bancária'),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Conta Corrente'),
                subtitle: Text('Saldo: R\$ 1200,00'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Cartão de Crédito'),
                subtitle: Text('Fatura: R\$ 350,00'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
