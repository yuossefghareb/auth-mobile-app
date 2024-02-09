import 'package:flutter/material.dart';

class MyModel with ChangeNotifier {
  bool abs = true;
  bool isread = false;
  IconData icon = Icons.remove_red_eye;
  IconData iconRead = Icons.check_box_outline_blank;
  chnageabs() {
    abs = !abs;
    if (abs)
      icon = Icons.visibility_off;
    else
      icon = Icons.visibility;
    notifyListeners();
  }

  chnagereadme() {
    isread = !isread;
    if (isread)
      iconRead = Icons.check_box;
    else
      iconRead = Icons.check_box_outline_blank;
    notifyListeners();
  }
}
