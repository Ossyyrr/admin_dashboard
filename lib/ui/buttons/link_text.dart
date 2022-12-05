// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          constraints: const BoxConstraints(minWidth: 50),
          child: Column(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  //decoration: isHover ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isHover ? 50 : 0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
