import 'package:expences/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransationList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //ListView.Builder is to optimise memory :it loads only what's visible <3
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text('No transactions added yet !!',style: Theme.of(context).textTheme.headline5,),
          const SizedBox(
            height: 20,
          ),

          SizedBox(
              child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
            height: 200,
          ),

        ],
        //the two points (:) means (else) if we have a transaction the app avoids the image ahead
      ):ListView.builder(
        itemBuilder: (ctx,index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 10.0,horizontal:15.0),
                  decoration: BoxDecoration(
                    border:Border.all(color: Theme.of(context).primaryColor,width: 2,),
                  ),

                  padding: const EdgeInsets.all(10),
                  child: Text(
                    transactions[index].amount.toStringAsFixed(2)+'dt',//'${tx.amount}dt'
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: const TextStyle(fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(transactions[index].date),
                      //transactions[index].date.substring(0,10),
                      style: const TextStyle(color: Colors.grey,fontSize: 14,),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
