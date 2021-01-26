
import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:expensenote/models/Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'ChartBar.dart';

class Chart extends StatelessWidget {


  List<Map<String, Object>>  _groupTransactionValues(List<Transaction> recentTransaction) {

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double total = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          total += recentTransaction[i].price;

        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': total,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Transaction> recent = Provider.of<ListTransactions>(context).recentTransaction;
    final double total =  Provider.of<ListTransactions>(context).total;
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: FittedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ..._groupTransactionValues(recent).map((data) {
            return ChartBar(
              total: data['amount'],
              day: data['day'],
              presentTotal: total != 0
                  ? ((data['amount'] as double) / total)
                  : 0.0,
            );

            //Text('${data['day']} : ${data['amount']}');
          }).toList(),
        ]),
      ),
    );
  }
}
