import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/services/dictionary_service.dart';
import 'package:app_english/ui/widgets/dicts/dicts_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CardDicts extends StatefulWidget {
  const CardDicts({super.key});

  @override
  State<CardDicts> createState() => _CardDictsState();
}

class _CardDictsState extends State<CardDicts> {
  @override
  Widget build(BuildContext context) {
    List<Dictionary> dictsList =
        GetIt.I.get<DictionarySevice>().dictionaries.toList();
    int index = -1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chouse dictionary "),
      ),
      body: Column(
        children: [
          DictsList(index: index, dictsList: dictsList, tab: () {}),
        ],
      ),
    );
  }
}
