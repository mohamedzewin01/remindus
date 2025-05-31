import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../domain/useCases/Events_useCase_repo.dart';

part 'Events_state.dart';

@injectable
class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this._eventsUseCaseRepo) : super(EventsInitial());
  final EventsUseCaseRepo _eventsUseCaseRepo;
}
