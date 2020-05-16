import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wethepeople_flutter/classes/activities.dart';
import 'package:wethepeople_flutter/classes/food.dart';
import 'package:wethepeople_flutter/classes/transport.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'package:wethepeople_flutter/classes/VisaResponse.dart';

class Events with ChangeNotifier {
  dynamic food;
  List<String> foodNames = ['Loading'];
  String selectedFoodName;

  dynamic activities;
  List<String> activityNames = ['Loading'];
  String selectedActivity;

  dynamic location;
  List<String> locationNames = ['Select an Activity to begin'];
  String selectedLocation;

  dynamic transport;
  List<String> transportNames = ['Loading'];
  List<String> transportTimes = ['Loading'];

  String selectedTransport;
  String selectedTransportTime;

  String currencyActivities='SGD';
  String currencyFood='SGD';
  String currencyTransportation='SGD';

  double activityCosts=0;
  double foodCosts=0;
  double transportationCosts=0;
  double total=0;
  double finalActivityAmount=0;
  double conversionRate = 0;


  DateTime selectedDate = DateTime.now();

  Events() {
    getActivityNames();
    getFoodAPI();
    getTransportAPI();
  }

  void setSelectedDate(datetime){
    selectedDate = datetime;
    notifyListeners();
  }


  void sendRequest(amountinMYR) async {
    print(amountinMYR);
    var bodyEncoded =
    json.encode(<String, String>{"amountinmyr": "$amountinMYR"});

    print(bodyEncoded);
    final r = await http.post(
      'http://192.168.50.71:3000',
      body: bodyEncoded,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    final response = json.decode(r.body);
    print(response);
    final visaRes = VisaResponse.fromJson(response);
    finalActivityAmount = double.parse(visaRes.destinationAmount);
    conversionRate = double.parse(visaRes.conversionRate);
    print("finalActivityAmount");
    print("finalActivityAmount: $finalActivityAmount");
    calculateFood();
  }


  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
        selectedDate = picked;
    notifyListeners();
  }


  void calculateActivity(){
    // Get Index of activity & location
    List<dynamic> temp = List<dynamic>();
    for (int x=0; x < activities.length; x++){
      if (activities[x].type == selectedActivity){
        temp.add(activities[x]);
        for(int y=0; y < temp.length; y++){
          if (temp[y].location == selectedLocation)
            activityCosts = double.parse(temp[y].price);
            currencyActivities = temp[y].code == '702' ? 'SGD' : 'MYR';
        }
      }
    }
    if (currencyActivities == 'MYR')
    {
      print("is myr");
      sendRequest(activityCosts);
    }
    else{
      print('sgd');
      finalActivityAmount = activityCosts;
      calculateFood();
    }
  }

  void calculateFood(){
    // Get Index of Food
    List<dynamic> temp = List<dynamic>();

    for (int x=0; x < food.length; x++){
      if (food[x].name == selectedFoodName){
        temp.add(food[x]);
      }
    }
    foodCosts = double.parse(temp[0].priceNorm);
    calculateTransport();
  }
  void calculateTransport(){
    // Get Index of Transport
    List<dynamic> temp = List<dynamic>();

    for (int x=0; x < transport.length; x++){
      if (transport[x].type == selectedTransport){
        temp.add(transport[x]);
        for (int y=0; y<temp.length; y++){
          if (temp[y].time == selectedTransportTime)
            transportationCosts = double.parse(temp[y].price);
        }
      }
    }
    calculateTotal();
  }
  void calculateTotal(){
    print("FINAL finalActivityAmount");
    print("finalActivityAmount: $finalActivityAmount");
    total = finalActivityAmount + foodCosts + transportationCosts;
    notifyListeners();
  }

  void getTransportAPI(){
    Future<String> _loadTransportAPI() async {
      return await rootBundle.loadString('assets/fake_api/getTransportAPI.json');
    }

    Future getTransportAPI() async {
      String jsonString = await _loadTransportAPI();
      final jsonResponse = json.decode(jsonString);
      transport = jsonResponse.map((i) => Transport.fromJson(i)).toList();
      transportNames = List<String>();
      for (int x = 0; x < transport.length; x++) {
        if (transportNames.contains(transport[x].type)) {
          continue;
        } else {
          transportNames.add(transport[x].type);
        }
      }
    }
    getTransportAPI();
  }

  void selectTransport(type, time){
    selectedTransport = type;
    selectedTransportTime = time;
    notifyListeners();
  }

  void setTransportTimes(type){
    transportTimes = List<String>();
    for (int x = 0; x < transport.length; x++) {
      if (transportTimes.contains(transport[x].time)) {
        continue;
      } else {
        if (transport[x].type == type)
          transportTimes.add(transport[x].time);
      }
    }
    notifyListeners();
  }

  void getFoodAPI() {
    Future<String> _loadFoodAPI() async {
      return await rootBundle.loadString('assets/fake_api/getFoodAPI.json');
    }

    Future getFoodAPI() async {
      String jsonString = await _loadFoodAPI();
      final jsonResponse = json.decode(jsonString);
      food = jsonResponse.map((i) => Food.fromJson(i)).toList();
      foodNames = List<String>();
      for (int x = 0; x < food.length; x++) {
        if (foodNames.contains(food[x].name)) {
          continue;
        } else {
          foodNames.add(food[x].name);
        }
      }
    }

    getFoodAPI();
  }

  void getFoodNames() {
    getFoodAPI();
    notifyListeners();
  }

  void setFoodName(select) {
    selectedFoodName = select;
    notifyListeners();
  }

  void getActivitiesAPI() {
    Future<String> _loadActivityAPI() async {
      return await rootBundle
          .loadString('assets/fake_api/getActivitiesAPI.json');
    }

    Future getActivityAPI() async {
      String jsonString = await _loadActivityAPI();
      final jsonResponse = json.decode(jsonString);
      activities = jsonResponse.map((i) => Activities.fromJson(i)).toList();
      activityNames = List<String>();
      print(activities.toString());
      for (int x = 0; x < activities.length; x++) {
        if (activityNames.contains(activities[x].type)) {
        } else {
          activityNames.add(activities[x].type);
        }
      }
      print(locationNames);
    }

    getActivityAPI();
  }

  void getActivityNames() {
    getActivitiesAPI();
    notifyListeners();
  }

  void setActivityName(select) {
    selectedActivity = select;
    _filterList("ACTIVITY");
    notifyListeners();
  }

  void setLocationName(select) {
    selectedLocation = select;
    notifyListeners();
  }

  void _filterList(type){
    if (type == 'ACTIVITY'){
      /** Filters Location
       *
       */
      locationNames = List<String>();
      for (int x = 0; x < activities.length; x++) {
        { if (activities[x].type == selectedActivity)
          if (locationNames.contains(activities[x].location)) {
            continue;
          } else {
            locationNames.add(activities[x].location);
          }
        }
      }
      selectedLocation = locationNames[0];
    }
  }
}


