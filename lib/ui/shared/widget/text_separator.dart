import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  const TextSeparator({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5, top: 40),
      child: Text(text, style: GoogleFonts.roboto(fontSize: 12, color: Colors.white.withOpacity(0.3))),
    );
  }
}
