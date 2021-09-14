import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(const TestState());

  void updateText(String newText){
    emit(state.copyWith(
        text: newText
    ));
  }

}