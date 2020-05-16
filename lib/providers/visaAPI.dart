// Storing sandbox credentials here, bad practice, but running out of time in hackathon
// Gonna reset creds when it's over
import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:wethepeople_flutter/classes/VisaResponse.dart';

class VisaAPI with ChangeNotifier {
  String finalAmount;
  String conversionRate;

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
    finalAmount = visaRes.destinationAmount;
    conversionRate = visaRes.conversionRate;
    print(visaRes.conversionRate);
    print(visaRes.destinationAmount);
    print(visaRes.markUpRateApplied);
    print(visaRes.originalDestnAmtBeforeMarkUp);
    notifyListeners();
  }
}
