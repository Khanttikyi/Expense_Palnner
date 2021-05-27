import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class Transaction_item extends StatefulWidget {
  const Transaction_item({
    Key key,
    @required this.transaction,
    @required this.deleteItem,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteItem;

  @override
  _Transaction_itemState createState() => _Transaction_itemState();
}

class _Transaction_itemState extends State<Transaction_item> {
  Color _bgColor;
  @override
  void initState() {
    const avaluableColor=[Colors.purple,Colors.blue,Colors.red,Colors.orange];


    _bgColor=avaluableColor[Random().nextInt(4)];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Container(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              '\$ ${widget.transaction.amount}',
            )),
          ),
        ),
        title: Text(
          widget.transaction.name,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat.yMEd().format(widget.transaction.dateTime),
            style: TextStyle(color: Colors.red)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                onPressed: () => widget.deleteItem(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                textColor: _bgColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteItem(widget.transaction.id)),
      ),
    );
  }
}
