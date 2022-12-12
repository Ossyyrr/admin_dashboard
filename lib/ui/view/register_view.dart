import 'package:admin_dashboard/provider/auth_provider.dart';
import 'package:admin_dashboard/provider/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Ingrese su nombre';
                        if (value.length < 2) return 'El nombre debe tener al menos 2 caracteres';
                        return null; //Válido
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        icon: Icons.supervised_user_circle,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? ' ')) return 'Email no válido';
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => registerFormProvider.password = value,
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomOutlineButton(
                        text: 'Crear cuenta',
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;
                          AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                            name: registerFormProvider.name,
                            email: registerFormProvider.email,
                            password: registerFormProvider.password,
                          );
                        }),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Login',
                      onTap: () => Navigator.pushNamed(
                        context,
                        Flurorouter.loginRoute,
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
