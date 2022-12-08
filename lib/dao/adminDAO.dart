import 'dart:developer';
import 'package:ev_ui_admin/controller/admin_controller.dart';
import 'package:ev_ui_admin/models/admin.dart';
import 'package:flutter/material.dart';

class AdminDAO extends ChangeNotifier {
  Admin? _user;

  Admin? get user => _user;

  Future<bool> register({
    required String name,
    required String identityno,
    required String password,
  }) async {
    Map<String, dynamic>? data = await AdminController.register(
        name: name, identityno: identityno, password: password);

    if (data != null) {
      Admin u = Admin.fromMap(data);
      _user = u;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> login({
    required String identityno,
    required String password,
  }) async {
    Map<String, dynamic>? data =
        await AdminController.login(identityno: identityno, password: password);

    if (data != null) {
      Admin u = Admin.fromMap(data);
      _user = u;
      log(_user!.name!);
      notifyListeners();
      return true;
    }
    return false;
  }

// Future<bool> logout({

//   }) async {
//          UserController.logout();

//     if (data != null) {
//       User u = User.fromMap(data);
//       _user = null;
//       log(_user!.name!);
//       notifyListeners();

//     }
//   }

}
