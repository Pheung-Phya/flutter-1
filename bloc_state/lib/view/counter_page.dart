import 'package:bloc_state/cubit/counter_cubit.dart';
import 'package:bloc_state/view/counter_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage1 extends StatelessWidget {
  const CounterPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page 1')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) =>
            Center(child: Text('$count', style: const TextStyle(fontSize: 24))),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const CounterPage2())),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
