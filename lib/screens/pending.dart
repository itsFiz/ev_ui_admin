import 'package:flutter/material.dart';

class Pending extends StatefulWidget {
  final void Function() openDrawer;

  const Pending({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
