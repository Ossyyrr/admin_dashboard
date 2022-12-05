import 'package:flutter/cupertino.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Formulario válido');
      print('$name - $email - $password');
    } else {
      print('Formulario inválido');
    }
  }
}
