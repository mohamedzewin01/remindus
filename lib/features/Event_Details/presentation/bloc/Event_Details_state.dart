part of 'Event_Details_cubit.dart';

@immutable
sealed class EventDetailsState {}

final class EventDetailsInitial extends EventDetailsState {}
final class EventDetailsLoading extends EventDetailsState {}
final class EventDetailsSuccess extends EventDetailsState {}
final class EventDetailsFailure extends EventDetailsState {
  final Exception exception;

  EventDetailsFailure(this.exception);
}
