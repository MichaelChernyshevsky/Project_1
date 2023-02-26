import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';
import 'package:equatable/equatable.dart';

abstract class DictEvent extends Equatable {
  const DictEvent();
  @override
  List<Object> get props => [];
}

class LoadDictionaries extends DictEvent {
  const LoadDictionaries();
}

class AddDict extends DictEvent {
  final Dictionary name;

  const AddDict({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class AddWord extends DictEvent {
  final String name;
  final Word word;

  const AddWord({required this.name, required this.word});

  @override
  List<Object> get props => [name];
}

class ChangeDict extends DictEvent {
  final Dictionary dict;
  const ChangeDict({
    required this.dict,
  });

  @override
  List<Object> get props => [dict];
}

class DeleteDict extends DictEvent {
  final Dictionary dict;
  const DeleteDict({
    required this.dict,
  });

  @override
  List<Object> get props => [dict];
}
