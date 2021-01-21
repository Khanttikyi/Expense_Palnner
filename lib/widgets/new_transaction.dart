import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    widget.addTx(
      enterTitle,
      enterAmount,

    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 15,
        shadowColor: Colors.cyan,
        color: Colors.blue[50],
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: EdgeInsets.all(5),
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
                  decoration: InputDecoration(
                      labelText: 'Amount', focusColor: Colors.red),
                       keyboardType: TextInputType.number,
                  //  onChanged: (val){
                  //   amountInput=val;
                  // },
                  controller: amountController,
                ),
                FlatButton(
                  onPressed: submitData,
                  child: Text(
                    'ADD New',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.black,
                )
              ]),
        ),
      ),
    );
  }
}
