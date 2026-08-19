abstract class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;

  ApiResultSuccess(this.data);
}

class ApiResultError<T> extends ApiResult<T> {
  final String message;

  ApiResultError(this.message);
}
