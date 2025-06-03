// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // This import might be unused here if BLoCs are provided in AutoPortApp
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/app.dart';
import 'core/di/injection.dart';
// import 'core/constants/app_constants.dart'; // This import seems unused in the provided main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize dependency injection
  await initDependencies();

  runApp(const AutoPortApp());
} 