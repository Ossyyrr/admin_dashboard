import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool validateForm() {
    // formKey.currentState!.validate() pasa las validaciones de todos los textFormFields y devuelve true si todo está bien
    if (formKey.currentState!.validate()) {
      print('Formulario válido');
      print('$email - $password');
      print('Formulario inválido');
      return true;
    } else {
      print('formulario inválido');
      return false;
    }
  }
}
