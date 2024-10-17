import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final BehaviorSubject<int> _counterController = BehaviorSubject<int>.seeded(0);

  Stream<int> get counterStream => _counterController.stream;
  int get currentCounter => _counterController.value;

  void increment() {
    _counterController.add(currentCounter + 1);
  }

  void reset() {
    _counterController.add(0);
  }

  void dispose() {
    _counterController.close();
  }
}
