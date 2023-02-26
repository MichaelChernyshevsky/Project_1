import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/services/dictionary_service.dart';
import 'package:app_english/ui/widgets/dicts/dicts_list.dart';
import 'package:app_english/ui/widgets/dicts/words_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DictionariesScreen extends StatefulWidget {
  const DictionariesScreen({super.key});

  @override
  State<DictionariesScreen> createState() => _DictionariesScreenState();
}

class _DictionariesScreenState extends State<DictionariesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Dictionary> dictsList =
        GetIt.I.get<DictionarySevice>().dictionaries.toList();
    int index = -1;

    return Column(
      children: [
        DictsList(
          index: index,
          tab: () {
            // Navigator.push(context,
            //   WordsList(
            //           dict: dictsList[index],
            //           index: index,
            //           ),
            // );
          },
          dictsList: dictsList,
        ),
      ],
    );
  }
}
