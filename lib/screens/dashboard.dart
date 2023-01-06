import 'package:ev_ui_admin/services/admin_service.dart';
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
    AdminService? userDao = Provider.of<AdminService>(context);

    return Container();
  }
}
