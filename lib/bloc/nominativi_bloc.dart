import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nominativi_event.dart';
part 'nominativi_state.dart';

class NominativiBloc extends Bloc<NominativiEvent, NominativiState> {
  NominativiBloc() : super(NominativiInitial()) {
    on<controllaNominativoEsistente>((event, emit) {
      int x = Random().nextInt(10);
      if (x % 2 == 0) {
        emit(NominativoEsistente());
      } else {
        emit(NominativoInesistente());
      }
    });
  }

  @override
  Stream<NominativiState> mapEventToState(
    NominativiEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
