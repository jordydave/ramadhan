import 'package:get/get.dart';
import 'package:ramadhan_app/core/case/case.dart';
import 'package:ramadhan_app/domain/entity/surat/all_surat.dart';
import 'package:ramadhan_app/domain/usecase/all_surat/all_surat_usecase.dart';

part 'home_bloc.dart';

mixin _Extender {
  final tabIndex = 0.obs;
  final allSuratCase = Case<ListSurat>().obs;
}
