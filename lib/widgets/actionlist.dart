import 'package:expense_planner/widgets/transaction_item.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class ActionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteItem;

  ActionList(this.transactions, this.deleteItem);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: <Widget>[
                // Text(
                //   'There is no Transactions',
                //   style: Theme.of(context).textTheme.title,
                // ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraint.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/Norecord.gif',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return Transaction_item(transaction: transactions[index], deleteItem: deleteItem);
        //     },
        //     itemCount: transactions.length,
        //   );

        //Key//
        : ListView(
            children: transactions
                .map((tx) =>
                    Transaction_item(key:ValueKey(tx.id),transaction: tx, deleteItem: deleteItem))
                .toList());
  }
}

//  return Container(
//             margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2)),
//             // padding: EdgeInsets.all(15),
//             child: Card(
//                 child: Row(
//               children: <Widget>[

//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black, width: 2)),
//                     padding: EdgeInsets.all(15),
//                     child: Text(
//                       "${transactions[index].amount} \$",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 20),
//                     )),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       transactions[index].name,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 18),
//                     ),
//                     Text(
//                       transactions[index].description,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red,
//                           fontSize: 13),
//                     ),
//                     Text(
//                       DateFormat.yMEd().format(transactions[index].dateTime),
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 13),
//                     ),
//                   ],
//                 )
//               ],
//             )),
