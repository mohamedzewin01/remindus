import 'package:injectable/injectable.dart';
import 'package:remindus/features/Notifications/data/datasources/Notifications_datasource_repo.dart';
import '../../domain/repositories/Notifications_repository.dart';

@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsDatasourceRepo _notificationsDatasourceRepo;

  NotificationsRepositoryImpl(this._notificationsDatasourceRepo);

  // implementation
}
