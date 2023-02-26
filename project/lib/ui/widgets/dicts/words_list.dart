import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';
import 'package:app_english/ui/widgets/dicts/addWord.dart';
import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  const WordsList({
    super.key,
    required this.dict,
    required this.index,
  });

  final Dictionary dict;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextEditingController foreign = TextEditingController();
    final TextEditingController translation = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dict.name.toString(),
          style: const TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
              onPressed: () {
                addWord(context, dict.name, foreign, translation);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: dict.words.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((dict.words[index].foreign).toString()),
                  Text((dict.words[index].translation).toString()),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
