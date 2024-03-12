import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';
import 'package:ramadhan_app/domain/repository/surat_repository.dart';
import 'package:ramadhan_app/domain/usecase/detail_surat/detail_surat_usecase.dart';

class DetailSuratUsecaseImpl extends DetailSuratUsecase {
  final SuratRepository repository;
  DetailSuratUsecaseImpl(this.repository);

  @override
  Future<Either<String, DetailSurat>> getDetailSurat(int nomor) {
    return repository.getDetailSurat(nomor);
  }
}
