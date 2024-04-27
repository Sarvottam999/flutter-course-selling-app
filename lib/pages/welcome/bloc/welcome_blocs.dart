import 'package:app/pages/welcome/bloc/welcome_events.dart';
import 'package:app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomEvents, WelcomeState> {
  WelcomeBloc( ) :  super(WelcomeState()){
    on<WelcomEvents>((event, emit) => {
      emit(WelcomeState(page: state.page))
    });

  }

   
  
  
}