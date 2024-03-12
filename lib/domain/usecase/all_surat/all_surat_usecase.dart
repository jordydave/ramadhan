import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/domain/entity/surat/all_surat.dart';

abstract class AllSuratUsecase {
  Future<Either<String, ListSurat>> getAllSurat();
}
