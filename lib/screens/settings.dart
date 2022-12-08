import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final void Function() openDrawer;

  const Settings({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
