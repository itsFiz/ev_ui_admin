import 'package:flutter/material.dart';

class AdminService extends ChangeNotifier {
  bool isLoggedin = true;

  String? login({required String idNo, required String pwd}) {
    if (idNo == 'superadmin@ev.com' && pwd == 'xs2admin') {
      isLoggedin = true;
      notifyListeners();
    }

    if (idNo == 'staff@ev.com' && pwd == 'xs2staff') {
      isLoggedin = true;
      notifyListeners();
    } else {
      return 'Error sign in';
    }
  }

  void logout() {
    isLoggedin = false;
    notifyListeners();
  }
}
