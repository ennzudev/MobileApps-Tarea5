import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  bool isSelected = false;
  int? _selectedRadio = null;
  int? get getSelectedRadio => _selectedRadio;
  var costController = TextEditingController();
  double tipAmount = 0.0;

  var radioGroupValues = {
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Ok 15%",
  };
  void tipCalculation() {
    double cost = double.tryParse(costController.text) ?? 0.0;
    double tipPercentage;
    print(isSelected);

    if (_selectedRadio != null && cost > 0) {
      switch (_selectedRadio) {
        case 0:
          tipPercentage = 0.20;
          break;
        case 1:
          tipPercentage = 0.18;
          break;
        case 2:
          tipPercentage = 0.15;
          break;
        default:
          tipPercentage = 0.0;
      }

      double tipAmount = cost * tipPercentage;
      this.tipAmount = tipAmount;

      if (isSelected) {
        double roundedTip = tipAmount.ceilToDouble();
        this.tipAmount = roundedTip;
      }
    }

    notifyListeners();
  }

  void setIsSelected(bool switchValue) {
    isSelected = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? radioValue) {
    _selectedRadio = radioValue;
    notifyListeners();
  }
}
