import 'package:app_english/provider/user.provider.dart';
import 'package:app_english/ui/widgets/registration/reg_elements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/notification.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _Registration();
}

class _Registration extends State<RegistrationScreen> {
  bool isHiddenPassword = true;

  TextEditingController email = TextEditingController();
  TextEditingController passwordMain = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    passwordMain.dispose();
    passwordCheck.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void signUp() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (passwordCheck.text != passwordMain.text) {
      NotificationService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }
    Provider.of<UserProvider>(context, listen: false)
        .registration(context, email: email.text.trim(), password: passwordMain.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Зарегистрироваться'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputEmailReg(email: email),
              const SizedBox(height: 30),
              InputPasswordReg(
                passwordCheck: passwordCheck,
                tab: togglePasswordView,
                isHiddenPassword: isHiddenPassword,
              ),
              const SizedBox(height: 30),
              InputPasswordReg(
                passwordCheck: passwordMain,
                tab: togglePasswordView,
                isHiddenPassword: isHiddenPassword,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: signUp,
                child: const Center(child: Text('Регистрация')),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Войти',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
