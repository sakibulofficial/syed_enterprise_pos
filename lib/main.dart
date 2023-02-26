import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syed_enterprise_pos/app/my_app.dart';
import 'package:syed_enterprise_pos/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}
