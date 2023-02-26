import 'package:equatable/equatable.dart';
import '../../models/dictionaryes/dictionary.dart';

class DictState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends DictState {}

class ErrorState extends DictState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class LoadedDictState extends DictState {
  final List<Dictionary> dictionaries;
  LoadedDictState({
    this.dictionaries = const <Dictionary>[],
  });

  @override
  List<Object> get props => [dictionaries];
}
