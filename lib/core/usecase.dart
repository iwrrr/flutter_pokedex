abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class UseCase<P, T> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> call(P params);
}

abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  Future<T> call();
}
