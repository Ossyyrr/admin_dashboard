import 'package:admin_dashboard/ui/layout/auth/widget/background_twitter.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
// Desktop
        _DesktopBody(),
// Mobile
// Links
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody();

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
          )
        ],
      ),
    );
  }
}
