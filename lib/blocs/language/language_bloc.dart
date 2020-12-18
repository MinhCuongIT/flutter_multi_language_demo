import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_languges/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(LanguageState initialState) : super(initialState);

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    try {
      if (event is LoadLanguageEvent) {
        yield WaitingLanguageState();
        await S.load(event.newLocale);
        yield LoadDoneLanguageState(200.toString());
      }
    } catch (e) {
      print(e);
      yield ExceptionLanguageState(e.toString());
    }
  }
}
