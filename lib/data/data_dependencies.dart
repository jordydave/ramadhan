import 'package:get/get.dart';
import 'package:ramadhan_app/core/extension/extension.dart';
import 'package:ramadhan_app/data/datasource/surat_datasource.dart';
import 'package:ramadhan_app/data/repository_impl/surat_repository_impl.dart';
import 'package:ramadhan_app/domain/repository/surat_repository.dart';

class DataDependencies {
  DataDependencies() {
    Get.lazy(SuratDatasource(http: Get.find()));

    Get.lazy<SuratRepository>(SuratRepositoryImpl(Get.find()));
  }
}
