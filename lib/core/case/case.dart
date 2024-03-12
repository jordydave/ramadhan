class Case<T> {
  final int? code;
  final String? message;
  final T? data;

  Case({
    this.code,
    this.message,
    this.data,
  });
}

class InitialCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class InitLoadingCase<T> extends Case<T> {}

class ExceptionCase<T> extends Case<T> {
  ExceptionCase(Exception e) : super(message: e.toString());
}

class ErrorCase<T> extends Case<T> {
  ErrorCase(String e) : super(message: e);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}

///USED FOR NON GENERAL STATE
class FailedCase<T> extends Case<T> {
  FailedCase(T result) : super(data: result);
}
