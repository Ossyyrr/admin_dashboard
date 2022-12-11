import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Dashboard view', style: CustomLabels.h1),
        const SizedBox(height: 10),
        //   const WhiteCard(title: 'Sales Statistics', child: Text('Hola mundo')),
      ],
    ));
  }
}
