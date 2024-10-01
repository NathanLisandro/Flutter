import 'package:flutter/material.dart';
import './bank_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aplicação Bancária'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BankAccount<num> _account = BankAccount<num>(1000); // Conta com saldo inicial de 1000
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _withdrawController = TextEditingController();

  void _deposit() {
    final amount = num.tryParse(_depositController.text);
    if (amount != null) {
      setState(() {
        _account.deposit(amount);
      });
      _depositController.clear();
    }
  }

  void _withdraw() {
    final amount = num.tryParse(_withdrawController.text);
    if (amount != null && amount <= _account.getBalance()) {
      setState(() {
        _account.withdraw(amount);
      });
      _withdrawController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Saldo atual: R\$ ${_account.getBalance()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _depositController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor para Depósito',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _deposit,
              child: const Text('Depositar'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _withdrawController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor para Saque',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _withdraw,
              child: const Text('Sacar'),
            ),
          ],
        ),
      ),
    );
  }
}
