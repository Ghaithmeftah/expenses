import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return ;
    }
    widget.addtx(enteredTitle,enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                  labelText: 'title'
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val)=> titleinput=val,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // (_) means that i get an argument but i don't plan to use it
              //onChanged: (val) => amountinput=val,
            ),
            TextButton(
              child: const Text('Add Transaction',style: TextStyle(color: Colors.purple,),),
              onPressed: submitData,
            ),

          ],
        ),
      ),
    );
  }
}
