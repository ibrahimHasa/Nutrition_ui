part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppNewCategoryselectedState extends AppStates {}

class AppIncreaseCounterState extends AppStates {}
class AppDecreaseCounterState extends AppStates {}
