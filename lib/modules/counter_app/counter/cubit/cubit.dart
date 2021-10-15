import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter_app/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialCounterState());

  static CounterCubit get(context) => BlocProvider.of(context);

  var counter = 1;

  void minus() {
    counter--;
    emit(MinusState(counter));
  }

  void plus() {
    counter++;
    emit(PlusState(counter));
  }
}
