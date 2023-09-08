import 'package:flutter/material.dart';

class AgeProvider with ChangeNotifier {

  String eligibilityMessage = "";
  bool isEligible = false;

  void checkEligibility(int age){
    if(age >= 18) {
      eligibilityMessage = "You Are Eligible";
      isEligible = true;
      notifyListeners();
    }
    else {
      eligibilityMessage = "You Are Not Eligible";
      isEligible = false;
      notifyListeners();
    }
  }

}