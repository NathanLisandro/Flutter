import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatefulWidget {
  @override
  _BankingAppState createState() => _BankingAppState();
}

class _BankingAppState extends State<BankingApp> {
  final List<String> _accounts = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplicação Bancária'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAccountScreen(
                      onAddAccount: (account) {
                        setState(() {
                          _accounts.add(account);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Adicionar Conta'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _accounts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_accounts[index]),
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

class AddAccountScreen extends StatelessWidget {
  final Function(String) onAddAccount;
  final TextEditingController _controller = TextEditingController();

  AddAccountScreen({required this.onAddAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Conta'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nome da Conta'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onAddAccount(_controller.text);
              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
