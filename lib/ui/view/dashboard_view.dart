import 'package:admin_dashboard/provider/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Dashboard view', style: CustomLabels.h1),
        const SizedBox(height: 10),
        WhiteCard(
          title: authProvider.user!.nombre,
          child: Text(authProvider.user!.correo),
        ),
      ],
    ));
  }
}
