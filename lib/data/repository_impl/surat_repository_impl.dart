import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/data/datasource/surat_datasource.dart';
import 'package:ramadhan_app/domain/entity/surat/all_surat.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';
import 'package:ramadhan_app/domain/repository/surat_repository.dart';

class SuratRepositoryImpl extends SuratRepository {
  final SuratDatasource datasource;
  SuratRepositoryImpl(this.datasource);

  @override
  Future<Either<String, ListSurat>> getAllSurat() async {
    try {
      final result = await datasource.getAllSurat();
      return result.fold((error) {
        return Left(error);
      }, (response) {
        return Right(ListSurat.fromJson(response.toJson()));
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, DetailSurat>> getDetailSurat(int nomor) async {
    try {
      final result = await datasource.getDetailSurat(nomor);
      return result.fold((error) {
        return Left(error);
      }, (response) {
        return Right(DetailSurat.fromJson(response.toJson()));
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
