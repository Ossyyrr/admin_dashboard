import 'package:admin_dashboard/provider/auth_provider.dart';
import 'package:admin_dashboard/provider/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/view/blank_view.dart';
import 'package:admin_dashboard/ui/view/dashboard_view.dart';
import 'package:admin_dashboard/ui/view/icons_view.dart';
import 'package:admin_dashboard/ui/view/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      Provider.of<SideMenuProvider>(context, listen: false).currentPage = Flurorouter.dashboardRoute;
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      Provider.of<SideMenuProvider>(context, listen: false).currentPage = Flurorouter.iconsRoute;
      return const IconsView();
    } else {
      return const LoginView();
    }
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      Provider.of<SideMenuProvider>(context, listen: false).currentPage = Flurorouter.blankRoute;
      return const BlankView();
    } else {
      return const LoginView();
    }
  });
}
