import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';

abstract class DetailSuratUsecase {
  Future<Either<String, DetailSurat>> getDetailSurat(int nomor);
}
