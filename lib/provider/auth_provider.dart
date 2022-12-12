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

  void login(String email, String password) {
    String? token = 'aaa';
    // TODO Petición HTTP
    LocalStorage.prefs.setString('token', token);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
    isAuthenticated();
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
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario/Password no válidos: ' + e);
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token != null) {
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } else {
      await Future.delayed(const Duration(milliseconds: 500)); //Simular delay petición HTTP
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }
}
