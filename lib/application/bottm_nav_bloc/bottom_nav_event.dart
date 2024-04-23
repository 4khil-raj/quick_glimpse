part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavCallEvent extends BottomNavEvent {
  int currentIndex;
  BottomNavCallEvent({required this.currentIndex});
}

class BottomImageEvent extends BottomNavEvent {}
