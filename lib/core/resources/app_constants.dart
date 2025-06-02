import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remindus/features/Events/presentation/pages/Events_page.dart';
import 'package:remindus/features/Home/presentation/pages/Home_page.dart';
import 'package:remindus/features/Notifications/presentation/pages/Notifications_page.dart';
import 'package:remindus/features/Profile/presentation/pages/Profile_page.dart';
import 'package:remindus/l10n/app_localizations.dart';

class AppConstants {
  static const String version = 'v1.0.0';
  static const viewOptions = [
    HomePage(),
    EventsPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  static final currentUserId = FirebaseAuth.instance.currentUser?.uid;
 static List<String> getCategories(BuildContext context) {
    return [
      AppLocalizations.of(context)!.work,
      AppLocalizations.of(context)!.personal,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.appointment,
      AppLocalizations.of(context)!.other,
    ];
  }

}
