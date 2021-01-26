import 'package:expensenote/Providers/DeletedTransactions.dart';
import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:expensenote/screens/DeletedScreen.dart';
import 'package:expensenote/screens/FavoriteScreen.dart';
import 'package:expensenote/screens/TabScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Transaction.dart';

void main() {
  runApp(MaterialApp(
    home: Planner(),
  ));
}

class Planner extends StatefulWidget {
  @override
  _PlannerState createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {


  final List<Transaction> listTransaction = [];

  @override
  Widget build(BuildContext context) {
    ListDeletedTransactions deletedList = ListDeletedTransactions();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: ListTransactions(deletedList: deletedList)),
        ChangeNotifierProvider.value(value: deletedList)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Quicksand-Bold',
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'Quicksand-Bold',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreen(),
          DeletedListScreen.routeName: (ctx) => DeletedListScreen(),
          FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        },
      ),
    );
  }
}
