import 'package:app_english/models/app_route.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/ui/widgets/dicts/words_list.dart';
import 'package:flutter/material.dart';

class DictsList extends StatelessWidget {
  const DictsList({
    super.key,
    required this.dictsList,
    required this.tab,
    required this.index,
  });

  final List<Dictionary> dictsList;
  final VoidCallback tab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dictsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                tab;
                index = index;
              },
              title: Text(
                dictsList[index].name,
              ),
            ),
          );
        },
      ),
    );
  }
}
