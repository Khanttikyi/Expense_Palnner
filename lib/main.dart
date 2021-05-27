import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/actionlist.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/flexbox.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  // );
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
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSan',
                  fontSize: 25,
                ),
                subtitle: TextStyle(color: Colors.red, fontSize: 20)),
          )
          // accentColor: Colors.red
          ),
      home: MyHomePage(title: 'Expense Planner'),
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
    // Transaction(
    //     name: ' Galaxy S20',
    //     id: '02311',
    //     amount: 14.99,
    //     description: 'Description',
    //     dateTime: DateTime.now()),
    // Transaction(
    //     name: 'S20 Plus',
    //     id: '04311',
    //     amount: 15.99,
    //     description: 'Description',
    //     dateTime: DateTime.now()),
    // Transaction(
    //     name: 'S20 Ultra',
    //     id: '08743',
    //     amount: 19.99,
    //     description: 'Description',
    //     dateTime: DateTime.now()),
  ];
  bool showChart = false;

  List<Transaction> get _recentTransactions {
    return _inputTransactoin.where((tx) {
      return tx.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNew(String title, double txamount, DateTime date) {
    final newList = Transaction(
        name: title,
        id: DateTime.now().toString(),
        amount: txamount,
        dateTime: date,
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

  void _deleteTransaction(String id) {
    setState(() {
      _inputTransactoin.removeWhere((tx) => tx.id == id);
    });
  }

  List<Widget> _buildLandscapeContent(AppBar appbar, Widget txListwidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Show Chart'),
          Switch.adaptive(
              value: showChart,
              onChanged: (val) {
                setState(() {
                  showChart = val;
                });
              })
        ],
      ),
      showChart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: Chart(_recentTransactions),
            )
          : txListwidget
    ];
  }

  List<Widget> _buildPortraitContent(AppBar appbar, Widget txListwidget) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      txListwidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context))
      ],
    );
    final txListwidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: ActionList(_inputTransactoin, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
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
                    // Image.network(
                    //   'https://turbologo.com/articles/wp-content/uploads/2019/07/samsung-logo-cover-678x381.jpg',
                    //   // height: 200,
                    // )
                    //  Image.asset('assets/images/Favourite (1).png')
                    if (isLandscape)
                      ..._buildLandscapeContent(appBar, txListwidget),
                    if (!isLandscape)
                      ..._buildPortraitContent(appBar, txListwidget),

                    // FlexBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => _startAddNewTransaction(context),
      // ),
    );
  }
}
