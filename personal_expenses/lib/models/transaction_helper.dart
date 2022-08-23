import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:personal_expenses/models/transaction.dart';

class TransactionHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'transactions_database01.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE transactions(id INTEGER PRIMARY KEY, title TEXT, value REAL, date DATETIME)');
      },
      version: 1,
    );
  }

  static Future<void> insertTransaction(Transaction transaction) async {
    final db = await TransactionHelper.db();

    final transactionMap = transaction.toMap();
    transactionMap['date'] = transactionMap['date'].toString();

    await db.insert(
      'transactions',
      transactionMap,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Transaction>> transactions() async {
    final db = await TransactionHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('transactions');

    return List.generate(maps.length, (i) {
      return Transaction(
        id: maps[i]['id'],
        title: maps[i]['title'],
        value: maps[i]['value'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  static Future<void> updateTransaction(Transaction transaction) async {
    final db = await TransactionHelper.db();

    await db.update(
      'transactions',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  static Future<void> deteleTransaction(int id) async {
    final db = await TransactionHelper.db();

    await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
