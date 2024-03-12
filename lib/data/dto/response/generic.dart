class Generic {
  final int? code;
  final String? message;
  final dynamic data;

  Generic({
    this.code,
    this.message,
    this.data,
  });

  factory Generic.fromJson(Map<String, dynamic> json) {
    return Generic(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json,
    );
  }

  factory Generic.status(int code, String message) {
    return Generic(
      code: code,
      message: message,
    );
  }

  factory Generic.exception(e) {
    return Generic(
      code: 400,
      message: e.toString(),
    );
  }
}
