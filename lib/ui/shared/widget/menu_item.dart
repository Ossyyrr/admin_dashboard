import 'package:admin_dashboard/provider/side_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      color: isHovered
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive
              ? null
              : () {
                  SideMenuProvider.closeMenu();
                  widget.onPressed();
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
                onEnter: (event) => setState(() => isHovered = true),
                onExit: (event) => setState(() => isHovered = false),
                child: Row(
                  children: [
                    Icon(widget.icon, color: Colors.white30),
                    const SizedBox(width: 10),
                    Text(
                      widget.text,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
