import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('${spendingAmount.toStringAsFixed(0)}dt'),
      const SizedBox(height: 4.0,),
      Container(
        height: 60.0,
        width: 10.0,
        child:Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1.0,),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          FractionallySizedBox(
            heightFactor: spendingPctOfTotal,
            child: Container(decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),),
          ),
        ],),
      ),
      const SizedBox(height: 4.0,),
      Text(label),
    ],);
  }
}
