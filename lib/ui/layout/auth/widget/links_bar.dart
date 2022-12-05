import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              LinkText(text: 'About', onTap: () => print('About')),
              const LinkText(text: 'Help Center'),
              const LinkText(text: 'Terms of Service'),
              const LinkText(text: 'Privacy Policy'),
              const LinkText(text: 'Cookie Policy'),
              const LinkText(text: 'Ads info'),
              const LinkText(text: 'Blog'),
              const LinkText(text: 'Status'),
              const LinkText(text: 'Careers'),
              const LinkText(text: 'Brand Resources'),
              const LinkText(text: 'Advertisings'),
              const LinkText(text: 'Marketing'),
            ],
          ),
        ),
      ),
    );
  }
}
