import 'package:flutter/material.dart';

class AgeProvider with ChangeNotifier {

  String eligibilityMessage = "";

  void checkEligibility(int age){
    if(age >= 18) {
      eligibilityMessage = "You Are Eligible";
      notifyListeners();
    }
    else {
      eligibilityMessage = "You Are Not Eligible";
      notifyListeners();
    }
  }

}