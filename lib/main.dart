import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramadhan_app/app_dependencies.dart';
import 'package:ramadhan_app/presentation/page/ramadhan_initial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await AppDependencies.init;
  runApp(const RamadhanInitial());
}
