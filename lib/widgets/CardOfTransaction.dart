import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/Transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({this.transaction});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<ListTransactions>(context);
    return Container(
      child: Dismissible(
        confirmDismiss: (_) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Do you wanna delete it?'),
                    actions: [
                      FlatButton(
                        child: Text('yes'),
                        onPressed: () {
                           Navigator.of(ctx).pop(true);
                        },
                      ),
                      FlatButton(
                          child: Text('cancel'),
                          onPressed: () {
                             Navigator.of(ctx).pop(false);
                          })
                    ],
                  ));
        },
        onDismissed: (_) => transactions.deleteTransaction(transaction,context),
        key: ValueKey(transaction.id),
        direction: DismissDirection.endToStart,
        background: Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: FittedBox(
              child: Text(
                '\$' + transaction.price.toString(),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          title: Text(transaction.title),
          subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
          trailing: Consumer<Transaction>(
            builder: (ctx, product, child) => IconButton(
              icon: transaction.isFavorite
                  ? Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    )
                  : Icon(Icons.star_border,
                      color: Theme.of(context).accentColor),
              onPressed: () {
                transaction.toggleFavorite();
              },
            ),
          ),
        ),
      ),
    );
  }
}
