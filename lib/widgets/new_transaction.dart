import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (val){
                //   titleInput=val;
                // },
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                //  onChanged: (val){
                //   amountInput=val;
                // },
                controller: amountController,
              ),
              FlatButton(
                onPressed: () {
                  addTx(titleController.text, double.parse(amountController.text));
                },
                child: Text('Submit'),
                textColor: Colors.blue,
              )
            ]),
      ),
    );
  }
}
