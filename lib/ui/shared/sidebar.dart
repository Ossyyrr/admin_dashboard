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
          const TextSeparator(text: 'main'),
          CustomMenuItem(text: 'Dashboard', icon: Icons.compass_calibration_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Analytics', icon: Icons.show_chart_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: () {}),
          const TextSeparator(text: 'UI Elements'),
          CustomMenuItem(text: 'Icons', icon: Icons.list_alt_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Campaign', icon: Icons.note_add_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Black', icon: Icons.post_add_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: () {}),
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
