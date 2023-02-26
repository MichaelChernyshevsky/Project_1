import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/services/dictionary_service.dart';
import 'package:bloc/bloc.dart';

import 'dict_state.dart';

class DictsBloc extends Bloc<DictEvent, DictState> {
  DictsBloc(this.dictionarySevice) : super(DictState()) {
    on<AddDict>(_onAddDict);
    on<ChangeDict>(_onChangeDict);
    on<DeleteDict>(_onDeleteDict);
    on<AddWord>(_onAddWord);
  }

  final DictionarySevice dictionarySevice;

  void _onAddDict(AddDict event, Emitter<DictState> emit) {}

  void _onAddWord(AddWord event, Emitter<DictState> emit) {}

  void _onChangeDict(ChangeDict event, Emitter<DictState> emit) {}

  void _onDeleteDict(DeleteDict event, Emitter<DictState> emit) {}
}
