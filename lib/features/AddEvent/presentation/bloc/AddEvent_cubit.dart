import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../domain/useCases/AddEvent_useCase_repo.dart';

part 'AddEvent_state.dart';

@injectable
class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit(this._addeventUseCaseRepo) : super(AddEventInitial());
  final AddEventUseCaseRepo _addeventUseCaseRepo;
}
