import 'package:admin_dashboard/service/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  void login(String email, String password) {
    String? token = 'aaa';

    print('Almacenar JWT:  $token');

    // TODO Petición HTTP
    LocalStorage.prefs.setString('token', token);
    LocalStorage.prefs.getString('token');

    // TODO Navegar al dashboard

    notifyListeners();
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
