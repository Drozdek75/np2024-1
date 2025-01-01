part of 'nominativi_bloc.dart';

@immutable
abstract class NominativiState {}

class NominativiInitial extends NominativiState {}

class NominativoEsistente extends NominativiState {}

class NominativoInesistente extends NominativiState {}  
