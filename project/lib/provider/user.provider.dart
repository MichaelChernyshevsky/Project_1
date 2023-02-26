import 'package:app_english/services/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }
  User? user;
  bool isExists = false;
  String? userMail;
  Future<bool> get isLoggedIn async => user != null;
  init() {
    user = FirebaseAuth.instance.currentUser;
    userMail = user?.email;
    if (user != null) {
      isExists = true;
    }
    FirebaseAuth.instance.authStateChanges().listen((event) {
      user = user;
      if (user != null) {
        isExists = true;
      } else {
        isExists = false;
      }
      notifyListeners();
    });
  }

// вход
<<<<<<< Updated upstream:app_english/lib/provider/user.provider.dart
  Future<User?> login(context,
      {required String email, required String password}) async {
=======
  Future<User?> login(context, {required String email, required String password}) async {
>>>>>>> Stashed changes:project/lib/provider/user.provider.dart
    try {
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        NotificationService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return null;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return null;
      }
    }
  }

// выход
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

// регистрация
  Future registration(context, {required password, required email}) async {
    try {
      user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        NotificationService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }
  }
//
}
