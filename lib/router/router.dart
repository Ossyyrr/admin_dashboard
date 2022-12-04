import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static FluroRouter router = FluroRouter();
  static String rootRoute = '/';

  // Auth Router

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard

  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: registerHandler);
    // router.define(dashboardRoute, handler: dashboardHandler);

    // router.notFoundHandler
  }
}
