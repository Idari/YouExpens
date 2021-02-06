import 'package:YouExpens/widgets/chart.dart';
import 'package:YouExpens/widgets/new_transaction.dart';
import 'package:YouExpens/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

class MyHomePage extends StatefulWidget
{
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{
  void _startAddNewTransaction(BuildContext cntx)
  {
    showModalBottomSheet
    (
      context: cntx,
      builder: (_)
      {
        return NewTransaction(_addNewTransaction);
      }
    );
  }

  final List<Transaction> _userTransaction = 
  [
    // Transaction(id: "t1", title: "Cola", amount: 18, date: DateTime.now()),
    // Transaction(id: "t2", title: "Magic", amount: 35, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions
  {
    return _userTransaction.where((tx) 
    {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount)
  {
    final newTx = Transaction
    (title: txTitle,
    amount: txAmount,
    date: DateTime.now(),
    id: DateTime.now().toString()
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar
        (
          title: Text("MyExpenses"),
          actions:
          [
            IconButton
            (
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)
            )
          ],
        ),

        body: SingleChildScrollView
        (
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
            [
              Chart(_recentTransactions),
              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton
        (
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}