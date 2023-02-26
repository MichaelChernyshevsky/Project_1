import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:flutter/material.dart';

Future<void> addDictionary(context, TextEditingController name) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink,
          title: const Text("Create Dictionary"),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          actionsOverflowButtonSpacing: 20,
          content: TextField(
            decoration: const InputDecoration(hintText: "Name new Dictionary"),
            controller: name,
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
                context
                    .read<DictsBloc>()
                    .add(AddDict(name: Dictionary(name.text)));
                name.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
