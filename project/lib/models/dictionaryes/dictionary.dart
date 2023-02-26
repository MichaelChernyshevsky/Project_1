import 'package:app_english/models/dictionaryes/word.dart';
import 'package:equatable/equatable.dart';

class Dictionary extends Equatable {
  final String name;
  final List<Word> words;

  const Dictionary._(this.name, this.words);

  factory Dictionary(String name, {List<Word>? words}) => Dictionary._(name, words ?? []);

  void addWord(Word word) {
    words.add(word);
  }

  @override
  List<Object?> get props => [name];
}
