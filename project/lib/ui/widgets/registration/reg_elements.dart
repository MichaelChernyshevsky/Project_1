import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class InputEmailReg extends StatelessWidget {
  const InputEmailReg({
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Введите Email',
      ),
    );
  }
}

class InputPasswordReg extends StatelessWidget {
  const InputPasswordReg({
    super.key,
    required this.passwordCheck,
    required this.tab,
    required this.isHiddenPassword,
  });

  final TextEditingController passwordCheck;
  final VoidCallback tab;
  final bool isHiddenPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: passwordCheck,
      obscureText: isHiddenPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value != null && value.length < 6 ? 'Минимум 6 символов' : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Введите пароль еще раз',
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
