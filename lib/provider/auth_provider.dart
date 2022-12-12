import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/service/local_storage.dart';
import 'package:admin_dashboard/service/navigation_service.dart';
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

    // TODO Petición HTTP
    LocalStorage.prefs.setString('token', token);
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo('/dashboard');

    isAuthenticated();
  }

  void register({required String email, required String password, required String name}) {
    //final Map<String, dynamic> data = {"nombre": "Test 7", "correo": "test7@test.com", "password": "123456"};
    final Map<String, dynamic> data = {"nombre": name, "correo": email, "password": password};

    CafeApi.httpPost('http://localhost:8080/api/usuarios', data).then((json) {
      print(json);
    }).catchError((e) {
      print('error en: $e');
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
