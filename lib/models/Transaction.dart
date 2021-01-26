import 'package:flutter/cupertino.dart';

class Transaction with ChangeNotifier{
  String id;
  String title;
  DateTime date;
  double price;
  bool isFavorite;

  Transaction({this.title, this.date, this.id, this.price,this.isFavorite = false});
  jsonToTransaction(){

  }
  transactionToJson(){

  }
  toggleFavorite(){
    isFavorite = ! isFavorite;
    notifyListeners();
  }
}