import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:remindus/core/common/api_result.dart';
import 'package:remindus/features/AddEvent/data/models/add_event_model.dart';
import '../../domain/useCases/AddEvent_useCase_repo.dart';

part 'AddEvent_state.dart';

@injectable
class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit(this._addeventUseCaseRepo) : super(AddEventInitial());
  final AddEventUseCaseRepo _addeventUseCaseRepo;

static AddEventCubit get(context) => BlocProvider.of(context);
  final List<Participant> participants = [];
  String category = 'Work';

  Future<void> addEvent(EventModel eventModel) async {
    emit(AddEventLoading());
    final result = await _addeventUseCaseRepo.createSampleEvent(eventModel);
    switch (result) {
      case Success<void>():
        {
          if (!isClosed) {
            emit(AddEventSuccess());
          }
        }
        break;
      case Fail<void>():
        {
          if (!isClosed) {
            emit(AddEventFailure(result.exception));
          }
        }
        break;
    }
  }
}
