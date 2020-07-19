import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: widget.transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'There are no items',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover, //this seems kind of optional here.
                    //height: 250.0,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: widget.transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).primaryColor,
                        )),
                        child: Text(
                          'Rs.${widget.transactions[index].amount.toStringAsFixed(1)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              DateFormat.yMMMMEEEEd()
                                  .format(widget.transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              //children: transactions.map((tr) {

              // }).toList(),
            ),
    );
  }
}
