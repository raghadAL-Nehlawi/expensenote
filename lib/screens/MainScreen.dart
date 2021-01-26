import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:expensenote/screens/AddedScreen.dart';
import 'package:expensenote/widgets/ListOfTransaction.dart';
import 'package:expensenote/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



enum SelectItem { AllTransaction, Favorite }

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexPage = 0;
  bool _showChart = false;

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

  @override
  Widget build(BuildContext context) {
    ListTransactions list = Provider.of<ListTransactions>(context);

    return Container(
        height: 1000,
        child: Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? Row(children: [
                      Text('Show Chart'),
                      Switch(
                        value: _showChart,
                        onChanged: (val) {
                          setState(() {
                            _showChart = val;
                          });
                        },
                      )
                    ])
                  : SizedBox(),
              !_showChart &&
                      MediaQuery.of(context).orientation ==
                          Orientation.landscape
                  ? SizedBox()
                  : Chart(),
              ListOfTransaction(list: list.transactions),
            ],
          ),
        ),
      );
  }
}
