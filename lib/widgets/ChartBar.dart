import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double total;
  final String day;
  final double presentTotal;

  ChartBar({this.total, this.day, this.presentTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(children: [
            Container(
              child: FittedBox(child: Text('\$' + total.toStringAsFixed(0))),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 60,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: FractionallySizedBox(
                          heightFactor: presentTotal,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(day),
            SizedBox(
              height: 5,
            )
          ]),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
