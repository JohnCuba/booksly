import 'dart:async';

class EventBus {
  final StreamController _streamController;

  EventBus() : _streamController = StreamController.broadcast(sync: false);

  Stream<T> on<T>() {
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(event) {
    _streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}
