part of 'Profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {}
final class ProfileFailure extends ProfileState {
  final Exception exception;

  ProfileFailure(this.exception);
}
