import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatefulWidget {
  @override
  _BankingAppState createState() => _BankingAppState();
}

class _BankingAppState extends State<BankingApp> {
  final List<String> _transactions = [];
  final TextEditingController _controller = TextEditingController();

  void _addTransaction(String transaction) {
    setState(() {
      _transactions.add(transaction);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicação Bancária'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Adicionar transação'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _addTransaction(_controller.text);
                }
              },
              child: Text('Adicionar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_transactions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
