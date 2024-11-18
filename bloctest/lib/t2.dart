import 'package:bloc/bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 1);
    });
  }
}

// Future<void> main() async {
//   final bloc = CounterBloc();
//   print(bloc.state); // 0
//   bloc.add(CounterIncrementPressed());
//   await Future.delayed(Duration.zero);
//   print(bloc.state); // 1
//   await bloc.close();
// }

Future<void> main() async {
  final bloc = CounterBloc();
  final subscription = bloc.stream.listen(print); // 1
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await bloc.close();
  await bloc.stream.listen(print);
}