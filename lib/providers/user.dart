import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  String username;
  double balance=200;
  double expenditure;

  void setUsername(String _username){
    this.username = _username;
    notifyListeners();
  }

  String getUsername(){
    return this.username;
  }

  double setBalance(){

    return this.balance;
  }

  double getBalance() {
    if (balance == null){
      return 50.0;
    }
    return this.balance;
  }
  double getExpenditure(){

    return this.expenditure;
  }
}