import 'package:flutter/cupertino.dart';

class ThemeDataChange extends ChangeNotifier{

     bool isDark = false;

     change(){

    notifyListeners();
  }
}