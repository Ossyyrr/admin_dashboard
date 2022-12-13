import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/service/local_storage.dart';
import 'package:admin_dashboard/service/navigation_service.dart';
import 'package:admin_dashboard/service/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;
  AuthProvider() {
    isAuthenticated();
  }

  void login({required String email, required String password}) {
    final Map<String, dynamic> data = {"correo": email, "password": password};

    CafeApi.httpPost('/auth/login', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio(); // Configurar el nuevo token en el header
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario/Password no válidos: ' + e);
    });
  }

  void register({required String email, required String password, required String name}) {
    final Map<String, dynamic> data = {"nombre": name, "correo": email, "password": password};
    CafeApi.httpPost('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio(); // Configurar el nuevo token en el header
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario/Password no válidos: ' + e);
    });
  }

  Future<bool> isAuthenticated() async {
    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    user = null;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }
}
