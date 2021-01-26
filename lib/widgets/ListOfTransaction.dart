
import 'package:expensenote/models/Transaction.dart';
import 'package:expensenote/widgets/CardOfTransaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListOfTransaction extends StatelessWidget {

  final List<Transaction> list;


   ListOfTransaction({this.list});

  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, index) {
            return Container(
              width: double.infinity,
              child: Card(
                  elevation: 10,
                  child: ChangeNotifierProvider.value(
                    value: list[index],
                    child: TransactionCard(
                      transaction: list[index],
                    ),
                  )),
            );
          }),
    );
  }
}
