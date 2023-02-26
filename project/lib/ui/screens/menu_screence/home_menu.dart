import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/blocs/dict/dict_state.dart';
import 'package:app_english/ui/screens/menu_screence/account/account_menu.dart';
import 'package:app_english/ui/screens/menu_screence/dictionari/dict_main.dart';
import 'package:app_english/ui/screens/menu_screence/study/study_main.dart';
import 'package:app_english/ui/widgets/dicts/addDictionary.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController controller;
  final TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    // BlocProvider.of<DictsBloc>(context).add(LoadDictionaries());
  }

  AppBar? getTitle(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: const Text(
            'Study',
            style: TextStyle(color: Colors.black87),
          ),
        );
      case 1:
        return AppBar(
          title: const Text(
            "Dictionaries",
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  addDictionary(context, name);
                },
                icon: const Icon(Icons.add)),
          ],
        );
      case 2:
        return AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black87),
          ),
        );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getTitle(controller.index),
        body: SafeArea(
          child: BlocBuilder<DictsBloc, DictState>(builder: (context, state) {
            // if (state is LoadedDictState) {
            if (true) {
              return TabBarView(
                controller: controller,
                children: const [
                  StudyScreen(),
                  DictionariesScreen(),
                  AccountScreen(),
                ],
              );
            }
            // if (state is ErrorState) {
            //   return Center(
            //     child: Text(state.message),
            //   );
            // }
            // return const Center(
            //   child: CircularProgressIndicator(),
            // );
          }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CustomNavigationBar(
            blurEffect: true,
            isFloating: true,
            borderRadius: const Radius.circular(22),
            iconSize: 22.0,
            selectedColor: const Color(0xff040307),
            strokeColor: const Color(0x30040307),
            unSelectedColor: const Color(0xffacacac),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.cast_for_education_rounded),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.lightbulb_outline),
              ),
            ],
            currentIndex: controller.index,
            onTap: (index) {
              setState(() {
                controller.animateTo(index);
              });
            },
          ),
        ));
  }
}
