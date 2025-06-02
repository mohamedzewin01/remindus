part of 'add_participant_cubit.dart';

@immutable
sealed class AddParticipantState {}

final class AddParticipantInitial extends AddParticipantState {}
final class AddParticipantLoading extends AddParticipantState {}
final class AddParticipantSuccess extends AddParticipantState {
  final Participant participant;

  AddParticipantSuccess(this.participant);
}
final class AddParticipantFailure extends AddParticipantState {
  final Exception exception;

  AddParticipantFailure(this.exception);
}
