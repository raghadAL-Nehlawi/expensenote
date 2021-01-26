
import 'package:expensenote/Providers/ListTransaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddedScreen extends StatefulWidget {
  final ListTransactions list;

  const AddedScreen({ this.list});

  @override
  _AddedScreenState createState() => _AddedScreenState();
}

class _AddedScreenState extends State<AddedScreen> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  DateTime _selectTime;

  void _submitData(ctx) {

    if ( titleController.text == null ||
        double.parse( priceController.text) < 0 ||
         _selectTime == null) return;

    widget.list.addTransaction(
         titleController.text, double.parse( priceController.text),  _selectTime);
    print(widget.list.transactions.length.toString());

    Navigator.of(ctx).pop();
  }

  void _pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
         _selectTime = value;
      });

    });
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller:  titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            controller:  priceController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(context),
          ),
          Row(
            children: [
              Text( _selectTime == null
                  ? 'NO date Chosen'
                  : DateFormat.yMMMd().format( _selectTime)),
              FlatButton(
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () => _pickDate(context),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Text('Add Transaction'),
              onPressed: () => _submitData(context),
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
