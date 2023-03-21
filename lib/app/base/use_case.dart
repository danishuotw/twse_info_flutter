abstract class UseCase<T, P> {
  Future<T> call({required P params});
}

abstract class Watcher<T, P> {
  Stream<T> call({required P params});
}
