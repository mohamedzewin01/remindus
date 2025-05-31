part of 'Events_cubit.dart';

@immutable
sealed class EventsState {}

final class EventsInitial extends EventsState {}
final class EventsLoading extends EventsState {}
final class EventsSuccess extends EventsState {}
final class EventsFailure extends EventsState {
  final Exception exception;

  EventsFailure(this.exception);
}
