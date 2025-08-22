import 'package:flutter/material.dart';

class ColorNotifier extends ChangeNotifier{
  Color _primaryColor = const Color(0xFF000000);
  Color _secondaryColor = const Color(0xFF000000);

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  void updatePrimaryColor(Color primaryColor) {
    if(primaryColor == _primaryColor){
      return;
    }
    _primaryColor = primaryColor;
    notifyListeners();
  }

  void updateSecondaryColor(Color secondaryColor) {
    if(secondaryColor == _secondaryColor){
      return;
    }
    _secondaryColor = secondaryColor;
    notifyListeners();
  }
}
