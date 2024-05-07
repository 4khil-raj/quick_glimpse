part of 'alerts_bloc.dart';

sealed class AlertsEvent extends Equatable {
  const AlertsEvent();

  @override
  List<Object> get props => [];
}

class AlertRequstEvent extends AlertsEvent {}
