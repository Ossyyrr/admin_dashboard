import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        'Dashboard',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    ));
  }
}