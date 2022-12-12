import 'package:flutter/cupertino.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('Formulario válido');
      print('$name - $email - $password');
      return true;
    } else {
      print('Formulario inválido');
      return false;
    }
  }
}
