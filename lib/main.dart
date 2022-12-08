import 'package:ev_ui_admin/screens/dashboard.dart';
import 'package:ev_ui_admin/screens/registration/signin.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ev_ui_admin/dao/adminDAO.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider<AdminDAO>(
        create: (context) => AdminDAO(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignIn(),
        ),
      );
    });
  }
}
