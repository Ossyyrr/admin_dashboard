import 'package:admin_dashboard/provider/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context);
        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: loginFormProvider.formKey, // Da acceso en mi provider a todo el estado del formulario
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) return 'Email no válido';
                        return null;
                      },
                      onChanged: (value) => loginFormProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        onChanged: (value) => loginFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if (value.length < 6) return 'La contraseña debe tener al menos 6 caracteres';
                          return null; //Válido
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        )),
                    const SizedBox(height: 20),
                    CustomOutlineButton(
                      text: 'Ingresar',
                      onPressed: () {
                        loginFormProvider.validateForm();
                      },
                    ),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Nueva cuenta',
                      onTap: () => Navigator.pushNamed(
                        context,
                        Flurorouter.registerRoute,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
