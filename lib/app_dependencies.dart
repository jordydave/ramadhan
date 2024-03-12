import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:ramadhan_app/core/core_dependencies.dart';
import 'package:ramadhan_app/core/logger/dev_tree.dart';
import 'package:ramadhan_app/data/data_dependencies.dart';
import 'package:ramadhan_app/domain/domain_dependencies.dart';

class AppDependencies {
  static Future<void> get init async {
    if (kReleaseMode == false) Fimber.plantTree(DevTree());
    CoreDependencies();
    DataDependencies();
    DomainDependencies();
  }
}
