import 'package:flutter/material.dart';
import './new_transaction.dart';
import './actionlist.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _inputTransactoin = [
    Transaction(
        name: 'Samsung Galaxy S20',
        id: '02311',
        amount: 14.99,
        description: 'Description',
        dateTime: DateTime.now()),
    Transaction(
        name: 'Samsung Galaxy S20 Plus',
        id: '04311',
        amount: 15.99,
        description: 'Description',
        dateTime: DateTime.now()),
    Transaction(
        name: 'Samsung Galaxy S20 Ultra',
        id: '08743',
        amount: 19.99,
        description: 'Description',
        dateTime: DateTime.now()),
    Transaction(
        name: 'Samsung Note 20 Ultra',
        id: '04243',
        amount: 22.99,
        description: 'Description',
        dateTime: DateTime.now()),
  ];
  void addNew(String title, double txamount) {
    final newList = Transaction(
        name: title,
        id: '04243',
        amount: txamount,
        dateTime: DateTime.now(),
        description: 'Description');
    setState(() {
      _inputTransactoin.add(newList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(addNew), ActionList(_inputTransactoin)],
    );
  }
}
