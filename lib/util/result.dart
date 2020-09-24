class Result<T> {
  final T data;
  final Exception error;

  Result._({this.data, this.error});

  factory Result.success(T data) => Result._(data: data);
  factory Result.error(Exception e) => Result._(error: e);

  bool get isSuccess => data != null;

  bool get isError => !isSuccess;
}

class ConnectionError<T> extends Result<T> {
  ConnectionError() : super._();
}
