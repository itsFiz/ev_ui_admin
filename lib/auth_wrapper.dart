import 'package:ev_ui_admin/dao/adminDAO.dart';
import 'package:ev_ui_admin/screens/dashboard.dart';
import 'package:ev_ui_admin/screens/navigation.dart';
import 'package:ev_ui_admin/screens/registration/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminDAO>(
      builder: (context, userDAO, child) {
        if (userDAO.user == null) {
          return SignIn();
        } else {
          return Navi();
        }
      },
    );
  }
}
