import 'package:flutter/material.dart';

class NewTransaction  extends StatefulWidget
{
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData()
  {
    final entredTitle = titleController.text;
    final entredAmount = double.parse(amountController.text);

    if (entredTitle.isEmpty || entredAmount <= 0)
    {
      return; 
    }
    widget.addTx
    (
      entredTitle,
      entredAmount
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card
            (
              child: Container
              (
                padding: EdgeInsets.all(10),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: 
                  [
                    TextField
                    (

                      decoration: InputDecoration
                      (
                        labelText: "Title"
                      ),
                    onSubmitted: (_) => submitData(),
                    controller: titleController,

                    ),
                    TextField
                    (
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => submitData(),
                      decoration: InputDecoration
                      (
                        labelText: "Amount"
                      ),
                    //  onChanged: (value) => amountInput = value,
                    controller: amountController,
                    ),
                    FlatButton
                    (
                      child: Text("Add Transaction"),
                      onPressed: submitData,
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            );
  }
}