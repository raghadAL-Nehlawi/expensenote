import 'package:expensenote/Providers/DeletedTransactions.dart';
import 'package:expensenote/models/Transaction.dart';
import 'package:flutter/cupertino.dart';


class ListTransactions with ChangeNotifier {
  final ListDeletedTransactions deletedList;
  List<Transaction> _transactions = [];

  ListTransactions({this.deletedList});



  List<Transaction> get transactions => [..._transactions];


  void addTransaction(String title, double price, DateTime dateTime) {
    _transactions.add(
        new Transaction(title: title,
            price: price,
            date: dateTime,
            id: DateTime.now().toString()));
    notifyListeners();
  }

  void deleteTransaction(Transaction tr,BuildContext context) {
   deletedList.addTransaction(tr);
    _transactions.remove(tr);
    notifyListeners();

  }

  List<Transaction> get recentTransaction {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  double get total {
    double ret = 0.0;
    _transactions.forEach((element) {
      ret += element.price;
    });
    return ret;
  }

  List<Transaction> get favorite{
    return _transactions.where((element) => element.isFavorite ).toList();
  }


}