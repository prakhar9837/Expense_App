import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function userTransaction;
  NewTransaction(this.userTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submitRequest() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);
    //print(titleInput.text + amountInput.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) return;

    widget.userTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).pop();
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              // onChanged: (value) {
              //   titleInput = value;
              // },
              //onSubmitted: (_) => submitRequest(),
              controller: titleInput,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //for android it can work only with TextInputType.number
              onSubmitted: (val) {
                submitRequest();
                // print(val);
              },
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountInput,
            ),
            FlatButton(
              onPressed: submitRequest,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColorLight,
            ),
          ],
        ),
      ),
    );
  }
}
