import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wethepeople_flutter/classes/food.dart';

class Events with ChangeNotifier{
  dynamic food;
  List<String> foodNames;
  Events(){
    getFoodAPI();
  }
  String chosenFood;

  void getFoodAPI() {
    Future<String> _loadFoodAPI() async {
      return await rootBundle.loadString('assets/fake_api/getFoodAPI.json');
    }
    Future getFoodAPI() async {
      String jsonString = await _loadFoodAPI();
      final jsonResponse = json.decode(jsonString);
      food = jsonResponse.map((i)=>Food.fromJson(i)).toList();
      print(food[0].name);
      foodNames = List<String>();
      for (int x = 0 ; x < food.length; x++){
        foodNames.add(food[x].name);
      }
    }
    getFoodAPI();
  }

  List<String> getFoodNames(){
    return foodNames;
    notifyListeners();
  }
  void setFoodName(){

  }

}