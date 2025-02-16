import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orari_event.dart';
part 'orari_state.dart';

class OrariBloc extends Bloc<OrariEvent, OrariState> {
  OrariBloc() : super(OrariInitial()) {
    on<OrariEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
