import 'package:expensenote/models/Transaction.dart';
import 'package:flutter/cupertino.dart';


class ListDeletedTransactions with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => [..._transactions];



  void addTransaction(Transaction tr){
    _transactions.add(tr);
    notifyListeners();
  }

  void deleteTransaction(Transaction tr) {

    _transactions.remove(tr);
    notifyListeners();
  }






}