import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ingredient_counter_state.dart';

class IngredientCounterCubit extends Cubit<int> {
  IngredientCounterCubit() : super(1);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

  void reset() => emit(1);

}
