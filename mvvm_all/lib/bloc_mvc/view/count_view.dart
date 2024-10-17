import 'package:flutter/material.dart';
import 'package:mvvm_all/bloc_mvc/controller/count_bloc.dart';

class CounterView extends StatelessWidget {
  final CounterBloc _bloc = CounterBloc();

  CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('BLoC Counter')),
      body: StreamBuilder<int>(
        stream: _bloc.counterStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: ${snapshot.data}'),
                  ElevatedButton(
                    onPressed: _bloc.increment,
                    child:const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: _bloc.reset,
                    child:const Text('Reset'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
