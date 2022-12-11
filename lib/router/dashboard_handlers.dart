import 'package:admin_dashboard/provider/auth_provider.dart';
import 'package:admin_dashboard/ui/view/dashboard_view.dart';
import 'package:admin_dashboard/ui/view/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final AuthProvider authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );
}
