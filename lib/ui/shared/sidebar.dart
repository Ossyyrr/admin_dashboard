import 'package:admin_dashboard/ui/shared/widget/logo.dart';
import 'package:admin_dashboard/ui/shared/widget/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widget/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'main'),
          CustomMenuItem(
            text: 'Dashboard',
            icon: Icons.dashboard_outlined,
            isActive: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      color: Colors.red,
      gradient: LinearGradient(
        colors: [
          Color(0xff092044),
          Color(0xff092050),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 0),
        ),
      ],
    );
  }
}
