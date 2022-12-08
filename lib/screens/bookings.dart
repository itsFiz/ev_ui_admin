import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  final void Function() openDrawer;

  const Bookings({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
