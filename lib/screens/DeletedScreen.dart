import 'package:expensenote/Providers/DeletedTransactions.dart';
import 'package:expensenote/widgets/ListOfTransaction.dart';
import 'package:expensenote/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletedListScreen extends StatelessWidget {
  static final routeName = '/deletedItemScreen';
  ListDeletedTransactions list;
  @override
  Widget build(BuildContext context) {
      final list = Provider.of<ListDeletedTransactions>(context).transactions;

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Trash',
        ),
      ),
      body:   Column(children:[ListOfTransaction(list: list,)]),
    );
  }
}

