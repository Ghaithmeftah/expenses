import './Widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import './Widgets/transaction_List.dart';
import './models/transaction.dart';
import './Widgets/Chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.lightBlueAccent),
          ),
          home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      //late String titleinput;
  final List <Transaction> _userTransactions =[
    //Transaction(id: DateTime.now().toString(),title: 'NEW Shoes',amount: 69.99),
    //Transaction(id: DateTime.now().toString(),title: 'Food',amount: 30.99),
  ];
  List <Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
              const Duration(days: 7),
          ),
      );

    }).toList();
  }

  void _addNewTransaction(String txTitle,double txamount) {
    final newTx = Transaction(date: DateTime.now(), title: txTitle, amount: txamount);
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  void _startAddNewTransaction(BuildContext ctx){
    //it starts the process of addNewTransaction
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
      return GestureDetector(
        //avoid that when we tap on the sheet itself it doesn't close
        onTap: () {},
          child:NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses',style: TextStyle(fontFamily: 'Trajan Pro'),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add,)
            ,onPressed: ()=> _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Chart(_recentTransactions),
            TransationList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child:const Icon(Icons.add),
          onPressed: ()=> _startAddNewTransaction(context),
    ),
    );
  }
}
