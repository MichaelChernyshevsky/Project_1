import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class InputEmailLogin extends StatelessWidget {
  const InputEmailLogin({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      controller: email,
      validator: (email) => email != null && !EmailValidator.validate(email) ? 'Введите правильный Email' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: 'Введите Email',
      ),
    );
  }
}

class InputPasswordLogin extends StatelessWidget {
  const InputPasswordLogin({
    super.key,
    required this.password,
    required this.isHiddenPassword,
    required this.tab,
  });

  final TextEditingController password;
  final bool isHiddenPassword;
  final VoidCallback tab;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: password,
      obscureText: isHiddenPassword,
      validator: (value) => value != null && value.length < 6 ? 'Минимум 6 символов' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: Colors.orange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: 'Введите пароль',
        suffix: InkWell(
          onTap: tab,
          child: Icon(
            isHiddenPassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
