// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/AddEvent/data/datasources/AddEvent_datasource_repo.dart'
    as _i809;
import '../../features/AddEvent/data/datasources/AddEvent_datasource_repo_impl.dart'
    as _i347;
import '../../features/AddEvent/data/repositories_impl/AddEvent_repo_impl.dart'
    as _i558;
import '../../features/AddEvent/domain/repositories/AddEvent_repository.dart'
    as _i59;
import '../../features/AddEvent/domain/useCases/AddEvent_useCase_repo.dart'
    as _i847;
import '../../features/AddEvent/domain/useCases/AddEvent_useCase_repo_impl.dart'
    as _i153;
import '../../features/AddEvent/presentation/bloc/AddEvent_cubit.dart' as _i201;
import '../../features/Auth/data/datasources/Auth_datasource_repo.dart'
    as _i354;
import '../../features/Auth/data/datasources/Auth_datasource_repo_impl.dart'
    as _i485;
import '../../features/Auth/data/repositories_impl/Auth_repo_impl.dart'
    as _i295;
import '../../features/Auth/domain/repositories/Auth_repository.dart' as _i647;
import '../../features/Auth/domain/useCases/Auth_useCase_repo.dart' as _i628;
import '../../features/Auth/domain/useCases/Auth_useCase_repo_impl.dart'
    as _i971;
import '../../features/Auth/presentation/bloc/Auth_cubit.dart' as _i192;
import '../../features/Event_Details/data/datasources/Event_Details_datasource_repo.dart'
    as _i865;
import '../../features/Event_Details/data/datasources/Event_Details_datasource_repo_impl.dart'
    as _i504;
import '../../features/Event_Details/data/repositories_impl/Event_Details_repo_impl.dart'
    as _i880;
import '../../features/Event_Details/domain/repositories/Event_Details_repository.dart'
    as _i658;
import '../../features/Event_Details/domain/useCases/Event_Details_useCase_repo.dart'
    as _i54;
import '../../features/Event_Details/domain/useCases/Event_Details_useCase_repo_impl.dart'
    as _i1033;
import '../../features/Event_Details/presentation/bloc/Event_Details_cubit.dart'
    as _i783;
import '../../features/Events/data/datasources/Events_datasource_repo.dart'
    as _i558;
import '../../features/Events/data/datasources/Events_datasource_repo_impl.dart'
    as _i650;
import '../../features/Events/data/repositories_impl/Events_repo_impl.dart'
    as _i89;
import '../../features/Events/domain/repositories/Events_repository.dart'
    as _i614;
import '../../features/Events/domain/useCases/Events_useCase_repo.dart'
    as _i234;
import '../../features/Events/domain/useCases/Events_useCase_repo_impl.dart'
    as _i119;
import '../../features/Events/presentation/bloc/Events_cubit.dart' as _i373;
import '../../features/Home/data/datasources/Home_datasource_repo.dart'
    as _i827;
import '../../features/Home/data/datasources/Home_datasource_repo_impl.dart'
    as _i97;
import '../../features/Home/data/repositories_impl/Home_repo_impl.dart' as _i60;
import '../../features/Home/domain/repositories/Home_repository.dart' as _i126;
import '../../features/Home/domain/useCases/Home_useCase_repo.dart' as _i543;
import '../../features/Home/domain/useCases/Home_useCase_repo_impl.dart'
    as _i557;
import '../../features/Home/presentation/bloc/Home_cubit.dart' as _i371;
import '../../features/Notifications/data/datasources/Notifications_datasource_repo.dart'
    as _i1008;
import '../../features/Notifications/data/datasources/Notifications_datasource_repo_impl.dart'
    as _i474;
import '../../features/Notifications/data/repositories_impl/Notifications_repo_impl.dart'
    as _i954;
import '../../features/Notifications/domain/repositories/Notifications_repository.dart'
    as _i938;
import '../../features/Notifications/domain/useCases/Notifications_useCase_repo.dart'
    as _i767;
import '../../features/Notifications/domain/useCases/Notifications_useCase_repo_impl.dart'
    as _i53;
import '../../features/Notifications/presentation/bloc/Notifications_cubit.dart'
    as _i11;
import '../../features/Profile/data/datasources/Profile_datasource_repo.dart'
    as _i1046;
import '../../features/Profile/data/datasources/Profile_datasource_repo_impl.dart'
    as _i1017;
import '../../features/Profile/data/repositories_impl/Profile_repo_impl.dart'
    as _i810;
import '../../features/Profile/domain/repositories/Profile_repository.dart'
    as _i461;
import '../../features/Profile/domain/useCases/Profile_useCase_repo.dart'
    as _i369;
import '../../features/Profile/domain/useCases/Profile_useCase_repo_impl.dart'
    as _i589;
import '../../features/Profile/presentation/bloc/Profile_cubit.dart' as _i328;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i558.EventsDatasourceRepo>(
      () => _i650.EventsDatasourceRepoImpl(),
    );
    gh.factory<_i461.ProfileRepository>(() => _i810.ProfileRepositoryImpl());
    gh.factory<_i827.HomeDatasourceRepo>(() => _i97.HomeDatasourceRepoImpl());
    gh.factory<_i59.AddEventRepository>(() => _i558.AddEventRepositoryImpl());
    gh.factory<_i369.ProfileUseCaseRepo>(
      () => _i589.ProfileUseCase(gh<_i461.ProfileRepository>()),
    );
    gh.factory<_i1046.ProfileDatasourceRepo>(
      () => _i1017.ProfileDatasourceRepoImpl(),
    );
    gh.factory<_i1008.NotificationsDatasourceRepo>(
      () => _i474.NotificationsDatasourceRepoImpl(),
    );
    gh.factory<_i126.HomeRepository>(() => _i60.HomeRepositoryImpl());
    gh.factory<_i614.EventsRepository>(() => _i89.EventsRepositoryImpl());
    gh.factory<_i865.EventDetailsDatasourceRepo>(
      () => _i504.EventDetailsDatasourceRepoImpl(),
    );
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i809.AddEventDatasourceRepo>(
      () => _i347.AddEventDatasourceRepoImpl(),
    );
    gh.factory<_i938.NotificationsRepository>(
      () => _i954.NotificationsRepositoryImpl(
        gh<_i1008.NotificationsDatasourceRepo>(),
      ),
    );
    gh.factory<_i658.EventDetailsRepository>(
      () => _i880.EventDetailsRepositoryImpl(),
    );
    gh.factory<_i354.AuthDatasourceRepo>(() => _i485.AuthDatasourceRepoImpl());
    gh.factory<_i647.AuthRepository>(
      () => _i295.AuthRepositoryImpl(gh<_i354.AuthDatasourceRepo>()),
    );
    gh.factory<_i628.AuthUseCaseRepo>(
      () => _i971.AuthUseCase(gh<_i647.AuthRepository>()),
    );
    gh.factory<_i328.ProfileCubit>(
      () => _i328.ProfileCubit(gh<_i369.ProfileUseCaseRepo>()),
    );
    gh.factory<_i234.EventsUseCaseRepo>(
      () => _i119.EventsUseCase(gh<_i614.EventsRepository>()),
    );
    gh.factory<_i847.AddEventUseCaseRepo>(
      () => _i153.AddEventUseCase(gh<_i59.AddEventRepository>()),
    );
    gh.factory<_i54.EventDetailsUseCaseRepo>(
      () => _i1033.EventDetailsUseCase(gh<_i658.EventDetailsRepository>()),
    );
    gh.factory<_i543.HomeUseCaseRepo>(
      () => _i557.HomeUseCase(gh<_i126.HomeRepository>()),
    );
    gh.factory<_i373.EventsCubit>(
      () => _i373.EventsCubit(gh<_i234.EventsUseCaseRepo>()),
    );
    gh.factory<_i767.NotificationsUseCaseRepo>(
      () => _i53.NotificationsUseCase(gh<_i938.NotificationsRepository>()),
    );
    gh.factory<_i192.AuthCubit>(
      () => _i192.AuthCubit(gh<_i628.AuthUseCaseRepo>()),
    );
    gh.factory<_i201.AddEventCubit>(
      () => _i201.AddEventCubit(gh<_i847.AddEventUseCaseRepo>()),
    );
    gh.factory<_i371.HomeCubit>(
      () => _i371.HomeCubit(gh<_i543.HomeUseCaseRepo>()),
    );
    gh.factory<_i783.EventDetailsCubit>(
      () => _i783.EventDetailsCubit(gh<_i54.EventDetailsUseCaseRepo>()),
    );
    gh.factory<_i11.NotificationsCubit>(
      () => _i11.NotificationsCubit(gh<_i767.NotificationsUseCaseRepo>()),
    );
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
