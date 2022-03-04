import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/shared/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<_ThemeChanged>(_onThemeChanged);

    on<_AppStarted>(_onAppStarted);
  }
  FutureOr<void> _onThemeChanged(
      _ThemeChanged event, Emitter<ThemeState> emit) async {
    if (state.themeMode == ThemeMode.light) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
      await SharedPreferences.getInstance()
          .then((value) => value.setBool(isDark, true));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
      await SharedPreferences.getInstance()
          .then((value) => value.setBool(isDark, false));
    }
  }

  FutureOr<void> _onAppStarted(
      _AppStarted event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isdark = prefs.getBool(isDark) ?? false;
    if (isdark) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }
}
