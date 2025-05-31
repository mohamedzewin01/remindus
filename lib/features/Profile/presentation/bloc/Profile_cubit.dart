import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../domain/useCases/Profile_useCase_repo.dart';

part 'Profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileUseCaseRepo) : super(ProfileInitial());
  final ProfileUseCaseRepo _profileUseCaseRepo;
}
