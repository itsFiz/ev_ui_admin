import 'package:ev_ui_admin/dao/adminDAO.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final void Function() openDrawer;

  const Dashboard({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    AdminDAO? userDao = Provider.of<AdminDAO>(context);

    return Container();
  }
}
