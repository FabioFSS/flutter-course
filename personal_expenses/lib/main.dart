import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/components/chart.dart';
import 'package:personal_expenses/models/transaction_helper.dart';

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
  List<Transaction> _transactions = [];

  void _refreshTransactions() async {
    final data = await TransactionHelper.transactions();
    setState(() {
      _transactions = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTransactions();
  }

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

  _addTransaction(Transaction transaction) {
    TransactionHelper.insertTransaction(transaction);
    Navigator.of(context).pop();
    _refreshTransactions();
  }

  _deleteTransaction(int id) {
    TransactionHelper.deteleTransaction(id);
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
            onRemove: _deleteTransaction,
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
