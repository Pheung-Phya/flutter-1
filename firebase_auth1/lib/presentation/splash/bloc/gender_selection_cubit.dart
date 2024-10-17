import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(0);
  int selectedIndex = 1;
  void selecteGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
