import 'package:astro_assignment_project/business_logic/bloc/detail/ingredient_counter_cubit/ingredient_counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Ingredient serving counter test', () {
    blocTest<IngredientCounterCubit, int>(
      'Test nothing was added',
      build: () => IngredientCounterCubit(),
      expect: () => const <int>[],
    );

    blocTest<IngredientCounterCubit, int>(
      'Test increment the ingredient serving counter',
      build: () => IngredientCounterCubit(),
      act: (bloc) => bloc.increment(),
      expect: () => const <int>[2],
    );


    blocTest<IngredientCounterCubit, int>(
      'Test decrement the ingredient serving counter do nothing when state less than equal to 0',
      build: () => IngredientCounterCubit(),
      act: (bloc) => bloc.decrement(),
      expect: () => const <int>[],
    );
  });

}