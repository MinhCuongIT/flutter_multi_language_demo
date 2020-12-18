part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class InitialLanguageState extends LanguageState {
  @override
  List<Object> get props => [];
}
class WaitingLanguageState extends LanguageState {
  @override
  List<Object> get props => [];
}

class LoadDoneLanguageState extends LanguageState {
  final String code;

  LoadDoneLanguageState(this.code);

  @override
  List<Object> get props => [code];
}

class LoadFailLanguageState extends LanguageState {
  final String message;

  LoadFailLanguageState(this.message);

  @override
  List<Object> get props => [message];
}

class ExceptionLanguageState extends LanguageState {
  final String message;

  ExceptionLanguageState(this.message);

  @override
  List<Object> get props => [message];
}
