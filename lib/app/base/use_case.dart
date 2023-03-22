abstract class UseCase<T, P> {
  Future<T> call({required P params});
}

abstract class UseCaseWatcher<T, P> {
  Stream<T> call({required P params});
}
