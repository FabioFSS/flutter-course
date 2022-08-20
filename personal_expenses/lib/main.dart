import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'package:personal_expenses/components/chart.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  final myTheme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: myTheme.copyWith(
        colorScheme: myTheme.colorScheme.copyWith(
          primary: const Color(0xFF2C3333),
          secondary: const Color(0xFF395B64),
        ),
        textTheme: myTheme.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: const TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New running shoes',
      value: 300.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Computer',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
    Transaction(
      id: 't3',
      title: 'Teste',
      value: 2000.99,
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (element) => element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransactionn(String id) {
    setState(
      () {
        _transactions.removeWhere((element) => element.id == id);
      },
    );
  }

  _openTransactionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          onSubmit: _addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Personal Expenses',
        ),
        actions: [
          IconButton(
            onPressed: () => _openTransactionForm(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(
            recentTransactions: _recentTransactions,
          ),
          TransactionList(
            transactions: _transactions,
            onRemove: _deleteTransactionn,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () => _openTransactionForm(context),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
