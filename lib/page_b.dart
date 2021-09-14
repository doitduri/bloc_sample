import 'package:bloc_sample/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  late TestCubit _testCubit;

  @override
  void initState() {
    super.initState();
    _testCubit = context.read<TestCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TestCubit, TestState>(builder: (context, state) {
        return Wrap(
          runSpacing: 15,
          children: [
            Text(
              "${_testCubit.state.text}",
            ),
          ],
        );
      }),
    );
  }
}
