import 'package:expensenote/screens/DeletedScreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(

          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                'Sitting',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildListTile('Main Page ', Icons.web_outlined, (){
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile('Deleted Items', Icons.delete_forever_sharp, () {
              Navigator.of(context).pushReplacementNamed(DeletedListScreen.routeName);
            }),

          ],
        ),
      ),
    );
  }
}
