import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/domain/entity/surat/all_surat.dart';
import 'package:ramadhan_app/domain/repository/surat_repository.dart';
import 'package:ramadhan_app/domain/usecase/all_surat/all_surat_usecase.dart';

class AllSuratUsecaseImpl extends AllSuratUsecase {
  final SuratRepository repository;
  AllSuratUsecaseImpl(this.repository);

  @override
  Future<Either<String, ListSurat>> getAllSurat() {
    return repository.getAllSurat();
  }
}
