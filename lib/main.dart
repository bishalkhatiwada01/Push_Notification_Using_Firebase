

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notificationapp/api/firebase_api.dart';
import 'package:notificationapp/firebase_options.dart';
import 'package:notificationapp/views/home_page.dart';
import 'package:notificationapp/views/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
      navigatorKey: navigatorKey,
      routes: {'/notification_page': (context) => const NotificationPage()},
    );
  }
}
