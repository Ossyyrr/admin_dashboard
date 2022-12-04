import 'package:admin_dashboard/ui/view/login_view.dart';
import 'package:fluro/fluro.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, params) {
      return const LoginView();
    },
  );
}
