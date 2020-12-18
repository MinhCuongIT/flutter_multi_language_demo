part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LoadLanguageEvent extends LanguageEvent {
  final Locale newLocale;

  LoadLanguageEvent(this.newLocale);

  @override
  List<Object> get props => [newLocale];
}
