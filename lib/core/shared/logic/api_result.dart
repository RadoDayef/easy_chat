abstract class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;

  ApiResultSuccess(this.data);
}

class ApiResultFailure<T> extends ApiResult<T> {
  final String message;

  ApiResultFailure(this.message);
}
