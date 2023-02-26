import 'package:app_english/models/app_route.dart';

import 'package:app_english/ui/widgets/several_screence/account_elements.dart';
import 'package:flutter/material.dart';

class StudyBody extends StatefulWidget {
  const StudyBody({super.key});

  @override
  State<StudyBody> createState() => _StudyBodyState();
}

class _StudyBodyState extends State<StudyBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardElement(
              text: "Cards",
              icon: const Icon(
                Icons.copy_all_rounded,
              ),
              color: Colors.amber,
              tab: () {
                Navigator.pushNamed(context, AppRoute.cardDicts);
              },
            ),
          ],
        ),
      ),
    );
  }
}
