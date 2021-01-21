import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/actionlist.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Expense Planner (HOME)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(addNew),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          // Column
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  children: [
                    Image.network(
                      'https://turbologo.com/articles/wp-content/uploads/2019/07/samsung-logo-cover-678x381.jpg',
                      // height: 200,
                    )
                  ],
                ),
              ),
              ActionList(_inputTransactoin)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
