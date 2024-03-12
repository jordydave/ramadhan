import 'package:get/get.dart';
import 'package:ramadhan_app/core/extension/extension.dart';
import 'package:ramadhan_app/domain/usecase/all_surat/all_surat_usecase.dart';
import 'package:ramadhan_app/domain/usecase/all_surat/all_surat_usecase_impl.dart';
import 'package:ramadhan_app/domain/usecase/detail_surat/detail_surat_usecase.dart';
import 'package:ramadhan_app/domain/usecase/detail_surat/detail_surat_usecase_impl.dart';

class DomainDependencies {
  DomainDependencies() {
    Get.lazy<AllSuratUsecase>(AllSuratUsecaseImpl(Get.find()));
    Get.lazy<DetailSuratUsecase>(DetailSuratUsecaseImpl(Get.find()));
  }
}
