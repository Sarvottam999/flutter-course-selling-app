// import 'dart:html';

import 'package:app/app_events.dart';
import 'package:app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()){

    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter+1));

    },);
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter-1));

    },);
  }

  
  
}