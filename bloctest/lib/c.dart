
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state +1);
}

// void main() {
//   final cubit = CounterCubit();
//   print(cubit.state); // 0
//   cubit.increment();
//   print(cubit.state); // 1
//   cubit.close();
// }

Future<void> main() async {
  final cubit = CounterCubit();
  final subscription = cubit.stream.listen(print); // 1
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}