import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardGame extends StatelessWidget {
  List<int> dict = [1, 2, 3, 4, 5, 6, 7];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardGameScreen(dict: dict),
    );
  }
}

class CardGameScreen extends StatelessWidget {
  CardGameScreen({super.key, required this.dict});

  final List<int> dict;

  List<Widget> get cards => List<Widget>.generate(
        dict.length,
        (index) => FlipCard(
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT,

          front: Container(
            color: Colors.pink,
            child: Center(child: Text(dict[index].toString())),
          ),

          back: Container(
            color: Colors.pink,
            child: const Center(child: Text('Back')),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Score"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: AppinioSwiper(
                  cards: cards,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.green,
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
