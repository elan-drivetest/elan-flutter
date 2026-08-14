
import 'package:elan/data/trace/location_service.dart';
import 'package:elan/injection.dart';
import 'package:elan/presentation/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize DI first so services can resolve dependencies
  await configureDependencies();
  // Initialize Services after DI is ready
  LocationService.instance.init();
  runApp(MyApp());
}

