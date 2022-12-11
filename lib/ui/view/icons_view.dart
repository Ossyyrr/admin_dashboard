import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Icons', style: CustomLabels.h1),
        const SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: const [
            WhiteCard(title: 'ac_unit_outlined', width: 170, child: Center(child: Icon(Icons.ac_unit_outlined))),
            WhiteCard(
                title: 'celebration_outlined', width: 170, child: Center(child: Icon(Icons.celebration_outlined))),
            WhiteCard(title: 'percent_outlined', width: 170, child: Center(child: Icon(Icons.percent_outlined))),
            WhiteCard(title: 'av_timer_outlined', width: 170, child: Center(child: Icon(Icons.av_timer_outlined))),
            WhiteCard(title: 'verified_outlined', width: 170, child: Center(child: Icon(Icons.verified_outlined))),
            WhiteCard(title: 'av_timer_outlined', width: 170, child: Center(child: Icon(Icons.av_timer_outlined))),
            WhiteCard(title: 'html_outlined', width: 170, child: Center(child: Icon(Icons.html_outlined))),
            WhiteCard(title: 'local_atm_outlined', width: 170, child: Center(child: Icon(Icons.local_atm_outlined))),
          ],
        )
      ],
    ));
  }
}
