import 'package:admin_dashboard/provider/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/service/local_storage.dart';
import 'package:admin_dashboard/service/navigation_service.dart';
import 'package:admin_dashboard/ui/layout/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layout/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layout/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scrollbarTheme: ScrollbarThemeData(
            thickness: MaterialStateProperty.all(10),
            radius: const Radius.circular(10),
            thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        builder: (_, child) {
          final AuthProvider authProvider = Provider.of<AuthProvider>(context);
          if (authProvider.authStatus == AuthStatus.notAuthenticated) {
            return AuthLayout(child: child!);
          }
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          }
          return const SplashLayout();
        });
  }
}
