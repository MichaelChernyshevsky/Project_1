import 'package:app_english/ui/widgets/several_screence/account_elements.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   "assets/icons/backgdound.jpg",
        //   fit: BoxFit.cover,
        //   height: double.infinity,
        //   width: double.infinity,
        // ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardElement(
                  text: "Account",
                  icon: const Icon(
                    Icons.person,
                  ),
                  color: Colors.amber,
                  tab: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                CardElement(
                  text: "Info",
                  icon: const Icon(Icons.info),
                  color: Colors.amber,
                  tab: (() {}),
                ),
                const SizedBox(
                  height: 30,
                ),
                CardElement(
                  text: "Settings",
                  icon: const Icon(Icons.settings),
                  color: Colors.grey,
                  tab: (() {}),
                ),
                const SizedBox(
                  height: 30,
                ),
                CardElement(
                  text: "EXIT",
                  icon: const Icon(Icons.logout),
                  color: Colors.red,
                  tab: (() {}),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
