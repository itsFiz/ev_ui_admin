import 'package:ev_ui_admin/services/admin_service.dart';
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
    return Consumer<AdminService>(
      builder: (context, user, child) {
        if (!user.isLoggedin) {
          return const SignIn();
        } else {
          return const Navi();
        }
      },
    );
  }
}
