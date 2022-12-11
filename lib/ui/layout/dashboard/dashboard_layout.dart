import 'package:admin_dashboard/provider/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key, required this.child});
  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(child: widget.child),
                  ],
                ),
              ),
            ],
          ),
          // MOBILE
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SideMenuProvider.isOpen)
                    GestureDetector(
                      onTap: () => SideMenuProvider.closeMenu(),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 100),
                        opacity: SideMenuProvider.opacity.value,
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0),
                    child: const Sidebar(),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
