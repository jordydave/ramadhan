import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/domain/entity/surat/all_surat.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';

abstract class SuratRepository {
  Future<Either<String, ListSurat>> getAllSurat();
  Future<Either<String, DetailSurat>> getDetailSurat(int nomor);
}
