import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction_item extends StatelessWidget {
  const Transaction_item({
    Key key,
    @required this.transaction,
    @required this.deleteItem,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Container(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              '\$ ${transaction.amount}',
            )),
          ),
        ),
        title: Text(
          transaction.name,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
            DateFormat.yMEd().format(transaction.dateTime),
            style: TextStyle(color: Colors.red)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                onPressed: () => deleteItem(transaction.id),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteItem(transaction.id)),
      ),
    );
  }
}