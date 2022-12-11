import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bubble_chart_outlined, color: Colors.white.withOpacity(0.3), size: 40),
          const SizedBox(width: 10),
          Text(
            'Admin',
            style: GoogleFonts.montserratAlternates(fontSize: 20, fontWeight: FontWeight.w200, color: Colors.white),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
