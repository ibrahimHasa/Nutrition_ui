import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  void changeCategoryFont(index) {
    selectedIndex = index;
    emit(AppNewCategoryselectedState());
  }

  int counter = 0;
  void increaseCounter() {
    counter++;
    emit(AppIncreaseCounterState());
  }

  void decreaseCounter() {
    if (counter > 0) counter--;
    emit(AppDecreaseCounterState());
  }
}
