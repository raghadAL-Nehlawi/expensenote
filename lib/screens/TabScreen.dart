import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:expensenote/screens/AddedScreen.dart';
import 'package:expensenote/screens/FavoriteScreen.dart';
import 'package:expensenote/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  openSheet(ctx, list) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: AddedScreen(list: list),
        );
      },
    );
  }
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    ListTransactions list = Provider.of<ListTransactions>(context);
    final page = [
      MainScreen(),
      FavoriteScreen(
        list: list.favorite,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => openSheet(context, list),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      drawer: MainDrawer(),
      body:page[indexPage] ,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: indexPage,
        onTap: (index) {setState(() {

          indexPage = index;
        });

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_sharp),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Marked',
          ),
        ],
      ),
    );
  }
}
