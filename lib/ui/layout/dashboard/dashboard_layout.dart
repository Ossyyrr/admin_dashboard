import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(child: child),
        ],
      ),
    ));
  }
}
