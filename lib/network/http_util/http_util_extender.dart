part of 'http_util_impl.dart';

mixin _Extender {
  final _dio = Dio()..httpClientAdapter = HTTPAdapter(preserveHeaderCase: true);

  Map<String, dynamic> get _defaultHeader {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['accept'] = 'application/json';
    return headers;
  }

  Map<String, dynamic> _setHeader(Map<String, dynamic>? headers) {
    Map<String, dynamic> httpHeaders = _defaultHeader;
    if (headers != null) {
      headers.forEach((key, value) {
        httpHeaders[key] = value;
      });
    }
    return httpHeaders;
  }

  Either<Generic, Map<String, dynamic>> _dioResponse(
    Response<dynamic> response,
  ) {
    if (response.statusCode != 200) {
      return Left(
        Generic(
          code: response.statusCode,
          message: response.data?['message'] ?? response.statusMessage,
        ),
      );
    } else {
      return Right(response.data);
    }
  }

  Generic _dioCatch(DioException e) {
    final code = e.response?.statusCode ?? 400;
    return Generic(
      code: code,
      message: e.message,
    );
  }
}
