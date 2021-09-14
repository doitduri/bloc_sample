import 'package:bloc_sample/page_b.dart';
import 'package:bloc_sample/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  late TestCubit _testCubit;

  @override
  void initState() {
    super.initState();
    _testCubit = context.read<TestCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestA Page"),
      ),
      body: BlocBuilder<TestCubit, TestState>(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1. input text : ${state.text}"),
              Text("hint!! When entering \"test\", go to the page."),
              TextField(
                onChanged: (text) => _testCubit.updateText(text),
              ),
              MaterialButton(
                color: Colors.grey,
                onPressed: state.text == "test"
                    ? () => {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => BlocProvider<TestCubit>.value(
                                      value:
                                          BlocProvider.of<TestCubit>(context),
                                      child: PageB(),
                                    )),
                            (route) => false,
                          )
                        }
                    : null,
                child: Text("Go to next page"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
