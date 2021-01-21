import '../models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ActionList extends StatelessWidget {
  final List<Transaction> transactions;
  ActionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      
      child: ListView.builder(
        
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            // padding: EdgeInsets.all(15),
            child: Card(
                child: Row(
              children: <Widget>[
                
                Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "${transactions[index].amount} \$",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      transactions[index].description,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 13),
                    ),
                    Text(
                      DateFormat.yMEd().format(transactions[index].dateTime),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),
                    ),
                  ],
                )
              ],
            )),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
