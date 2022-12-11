import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Dashboard view', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(title: 'Sales Statistics', child: Text('Hola mundo')),
      ],
    ));
  }
}
