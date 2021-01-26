



import 'package:expensenote/models/Transaction.dart';
import 'package:expensenote/widgets/ListOfTransaction.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static final routeName = '/favoriteItemScreen';
  final List<Transaction> list;

  const FavoriteScreen({ this.list});
  @override
  Widget build(BuildContext context) {


    return    Column(children:[ListOfTransaction(list:list)]);

  }
}