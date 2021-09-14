part of 'test_cubit.dart';

class TestState extends Equatable {
  const TestState({this.text = ""});

  final String text;

  @override
  List<Object?> get props => [text];

  TestState copyWith({String? text}) {
    return TestState(text: text ?? this.text);
  }
}
