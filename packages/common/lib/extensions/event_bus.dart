import 'dart:async';
import 'dart:developer' as developer;

class EventBus<EventType> {
  final StreamController _streamController;

  EventBus() : _streamController = StreamController.broadcast(sync: false);

  Stream<T> on<T>() {
    developer.log('[EventBus]: Register listener $T', name: 'DEBUG');
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(EventType event) {
    developer.log('[EventBus]: Fire event ${event.runtimeType}', name: 'DEBUG');
    _streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}
