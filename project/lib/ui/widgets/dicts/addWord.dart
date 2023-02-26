import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';
import 'package:flutter/material.dart';

Future<void> addWord(context, String dictName, TextEditingController foreign,
    TextEditingController translation) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink,
          title: Text(dictName),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "Foreign"),
                controller: foreign,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Translation"),
                controller: translation,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                context.read<DictsBloc>().add(AddWord(
                    name: dictName,
                    word: Word(foreign.text, translation.text)));
                translation.clear();
                foreign.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
