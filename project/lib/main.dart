// Screense

import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/provider/user.provider.dart';
import 'package:app_english/services/dictionary_service.dart';
import 'package:app_english/ui/screens/menu_screence/home_menu.dart';
import 'package:app_english/ui/screens/menu_screence/study/card_choice.dart';
import 'package:app_english/ui/screens/start/login_screen.dart';
import 'package:app_english/ui/screens/start/reg_screen.dart';
import 'package:app_english/ui/screens/start/splash_screen.dart';
import 'package:app_english/ui/widgets/dicts/words_list.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'models/app_route.dart';
// Database
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _ = await Firebase.initializeApp(
    name: 'KnLang',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerSingleton<DictionarySevice>(DictionarySevice());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.addListener(() {
      if (!userProvider.isExists) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoute.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 102, 9, 88),
          appBarTheme: const AppBarTheme(color: Colors.pink)),
      routes: {
        AppRoute.initial: (_) => const SplashScreen(),
        AppRoute.registration: (_) => const RegistrationScreen(),
        AppRoute.login: (_) => const LoginScreen(),
        AppRoute.home: (context) => BlocProvider(
            create: (BuildContext context) =>
                DictsBloc(GetIt.I.get<DictionarySevice>()),
            child: const HomeScreen()),
        AppRoute.cardDicts: (_) => const CardDicts(),
      },
      initialRoute: AppRoute.initial,
    );
  }
}
