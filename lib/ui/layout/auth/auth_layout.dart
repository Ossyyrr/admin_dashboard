// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_dashboard/ui/layout/auth/widget/background_twitter.dart';
import 'package:admin_dashboard/ui/layout/auth/widget/custom_title.dart';
import 'package:admin_dashboard/ui/layout/auth/widget/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            size.width > 800
// Desktop
                ? _DesktopBody(child: child)

// Mobile
                : _Mobilebody(child: child),
// Links
            const LinksBar()
          ],
        ));
  }
}

class _Mobilebody extends StatelessWidget {
  final Widget child;
  const _Mobilebody({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 420,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
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
      height: size.height - 25,
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
