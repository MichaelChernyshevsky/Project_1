import 'package:app_english/models/app_route.dart';
import 'package:app_english/ui/widgets/login/login_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/user.provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool isHiddenPassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // очищение
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // скрыть/показать пароль
  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void login() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    Provider.of<UserProvider>(context, listen: false)
        .login(context, email: email.text.trim(), password: password.text.trim());
    if (Provider.of<UserProvider>(context, listen: false).isExists) {
      Navigator.of(context).pushNamed(AppRoute.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    // пароль

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Войти'),
        backgroundColor: Colors.transparent,
        toolbarHeight: 23,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/login-svgrepo-com.svg",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              InputEmailLogin(email: email),
              const SizedBox(height: 30),
              InputPasswordLogin(password: password, isHiddenPassword: isHiddenPassword, tab: togglePasswordView),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: login,
                child: const Center(child: Text('Войти')),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/reg'),
                child: const Text(
                  'Регистрация',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              // мы думаем что у нас есть акккунт но мы забыли паспрот )
              // TextButton(
              //   onPressed: () =>
              //       Navigator.of(context).pushNamed('/reset_password'),
              //   child: const Text('Сбросить пароль'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
