import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:remindus/features/Event_Details/domain/useCases/Event_Details_useCase_repo.dart';


part 'Event_Details_state.dart';

@injectable
class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(this._eventdetailsUseCaseRepo) : super(EventDetailsInitial());
  final EventDetailsUseCaseRepo _eventdetailsUseCaseRepo;
}
