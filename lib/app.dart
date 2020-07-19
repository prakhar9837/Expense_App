//import 'package:Expense/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: MyHomeApp(),
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.purple,
        // textTheme: ThemeData.dark().textTheme.copyWith(
        //       headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20.0),
        //     ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18.0,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 25.0,
                ),
              ),
        ),
        //accentColor: Colors.amber,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber,
          //hoverColor: Colors.red[200],
        ),
      ),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  greetingMessage(name) => Intl.message('Hello $name!',
      name: 'greetingMessage',
      args: [name],
      desc: 'Greet the user as they first open the application',
      examples: const {'name': 'Emily'});

  final List<Transaction> _usertransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Earphone',
    //   amount: 900.0,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New Shampoo',
    //   amount: 386.0,
    //   date: DateTime.now(),
    // ),
  ];

  void _addUserTransaction(String txTitle, double txAmount) {
    final tx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _usertransactions.insert(0, tx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext context) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addUserTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //  setState(() {
              _startAddNewTransaction(context);
              //  });
            },
            color: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  setState(() {
          _startAddNewTransaction(context);
          // });
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Text(greetingMessage('Prakhar')),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 20.0,
                  child: Text('Summary of the expense'),
                ),
              ),
              Chart(_usertransactions),
              //NewTransaction(_addUserTransaction),
              TransactionList(_usertransactions),
            ],
          ),
        ),
      ),
    );
  }
}
