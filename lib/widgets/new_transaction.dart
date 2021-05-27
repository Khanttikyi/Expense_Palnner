import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;
  void _submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTx(enterTitle, enterAmount, selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 15,
        shadowColor: Colors.orangeAccent,
        // color: Colors.orangeAccent,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black, width: 1),
              // borderRadius: BorderRadius.circular(15)),
              ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          
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
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : 'Pick Date : ${DateFormat.yMd().format(selectedDate)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: _presentDatepicker,
                        child: Text(
                          'Choose Date',
                        ),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: _submitData,
                  color: Colors.orange,
                  child: Text(
                    'ADD',
                    style: TextStyle(fontSize: 15),
                  ),
                  textColor: Colors.black,
                ),
              ]),
        ),
      ),
    );
  }
}
