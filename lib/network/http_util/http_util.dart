import 'package:dartz/dartz.dart';
import 'package:ramadhan_app/data/dto/response/generic.dart';

abstract class HttpUtil {
  Future<Either<Generic, Map<String, dynamic>>> get({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
  });

  Future<Either<Generic, Map<String, dynamic>>> post({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  });

  Future<Either<Generic, Map<String, dynamic>>> put({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<Generic, Map<String, dynamic>>> delete({
    required String uri,
    Map<String, String>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
    bool multipart = false,
  });
}
