import 'package:app_english/models/app_route.dart';
import 'package:app_english/provider/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (Provider.of<UserProvider>(context, listen: false).isExists) {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.home, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
