

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import 'package:remindus/features/AddEvent/domain/useCases/AddEvent_useCase_repo.dart';

part 'add_participant_state.dart';

@injectable
class AddParticipantCubit extends Cubit<AddParticipantState> {
  AddParticipantCubit(this._addParticipant) : super(AddParticipantInitial());
  final AddEventUseCaseRepo _addParticipant;

  Future<void> getParticipant(String query) async {
    emit(AddParticipantLoading());
    final result = await _addParticipant.getParticipantByNameOrEmail(query.trim());
    switch (result) {
      case Success<Participant?>():
        {
          if (!isClosed) {
            emit(AddParticipantSuccess(result.data!));
          }
        }
        break;
      case Fail<Participant?>():
        {
          if (!isClosed) {
            emit(AddParticipantFailure(result.exception));
          }
        }
        break;
    }
  }
}
