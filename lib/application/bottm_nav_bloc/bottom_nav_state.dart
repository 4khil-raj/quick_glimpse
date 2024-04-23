part of 'bottom_nav_bloc.dart';

class BottomNavState {
  int emittingIndex;

  BottomNavState({required this.emittingIndex});
}

// class BottomNavCurrentState extends BottomNavState {
//   int emittingIndex;
//   BottomNavCurrentState({required this.emittingIndex});
// }
class BottomImageState extends BottomNavState {
  String? profile;
  BottomImageState({required this.profile}) : super(emittingIndex: 0);
}
