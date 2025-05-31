import 'package:remindus/features/Events/presentation/pages/Events_page.dart';
import 'package:remindus/features/Home/presentation/pages/Home_page.dart';
import 'package:remindus/features/Notifications/presentation/pages/Notifications_page.dart';
import 'package:remindus/features/Profile/presentation/pages/Profile_page.dart';

class AppConstants {
  static const String version = 'v1.0.0';
  static const viewOptions = [
    HomePage(),
    EventsPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
}
