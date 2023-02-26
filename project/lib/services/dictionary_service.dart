import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';

class DictionarySevice {
  final Set<Dictionary> dictionaries = {};

  Future<bool> loadDictionaries() async {
    return false;
  }

  Future<bool> addDictionary(Dictionary dictionary) async {
    final bool isOk = dictionaries.add(dictionary);
    if (isOk) {
      // Hive add
      // Firebase add
    }
    return isOk;
  }

  Future<bool> addWordToDictionary(String dictionaryName, Word word) async {
    const bool isOk = true;
    // Hive add
    // Firebase add
    // In case of error => isOk = false

    dictionaries.firstWhere((element) => element.name == dictionaryName).addWord(word);

    return isOk;
  }

  cleanDictionary(String dictionaryName) {
    dictionaries
        .firstWhere((element) => element.name == dictionaryName, orElse: () {
          // Do something
          return Dictionary('');
        })
        .words
        .removeWhere((i) => true);
  }
}
