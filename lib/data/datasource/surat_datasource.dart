import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/data/dto/response/surat/all_surat_response.dart';
import 'package:ramadhan_app/data/dto/response/surat/detail_surat_response.dart';
import 'package:ramadhan_app/network/http_util/http_util.dart';

class SuratDatasource {
  final HttpUtil http;

  SuratDatasource({required this.http});

  Future<Either<String, ListSuratResponse>> getAllSurat() async {
    try {
      final result = await http.get(uri: 'https://equran.id/api/v2/surat');
      return result.fold(
        (error) => Left(error.message ?? ''),
        (response) {
          final result = ListSuratResponse.fromJson(response);
          return Right(result);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<String, DetailSuratResponse>> getDetailSurat(int nomor) async {
    try {
      final result = await http.get(uri: 'https://equran.id/api/v2/surat/$nomor');
      return result.fold(
        (error) => Left(error.message ?? ''),
        (response) {
          final result = DetailSuratResponse.fromJson(response);
          return Right(result);
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
