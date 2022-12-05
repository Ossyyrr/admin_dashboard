import 'package:admin_dashboard/ui/layout/auth/widget/background_twitter.dart';
import 'package:admin_dashboard/ui/layout/auth/widget/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
// Desktop
        _DesktopBody(child: child),
// Mobile
// Links
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          const BackgroundTwitter(),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 50),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
