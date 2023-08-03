import 'dart:async';
import 'dart:collection';

enum EntityStatus {
  pending,
  active,
  completed,
}

class ActiveQueueEntity<T> {
  final T data;
  EntityStatus status = EntityStatus.pending;
  Future<dynamic>? future;

  ActiveQueueEntity({
    required this.data,
    this.future,
  });
}

class ActiveQueue<T> {
  final Queue<ActiveQueueEntity<T>> _queue = Queue();
  List<ActiveQueueEntity<T>> get queue => _queue.toList();

  final Future<dynamic> Function(T entity, Function()? onReceiveProgress) runner;
  final int parallels;
  late Function()? onUpdate;

  ActiveQueue({
    required this.runner,
    this.parallels = 2,
    this.onUpdate,
  });

  _runTask(ActiveQueueEntity<T> entity) async {
    await runner(entity.data, onUpdate);

    entity.status = EntityStatus.completed;
    _checkQueue();
  }

  bool _cleanCompleted() {
    final completed = _queue.where((entity) => entity.status == EntityStatus.completed);

    if (completed.isEmpty) {
      return false;
    }

    _queue.removeWhere((element) => element.status == EntityStatus.completed);
    return true;
  }

  bool _runPended() {
    final active = _queue.where((entity) => entity.status == EntityStatus.active);

    if (active.length >= parallels) {
      return false;
    }

    final pended = _queue.where((entity) => entity.status == EntityStatus.pending);
    final needToActivate = parallels - active.length;
    final entitiesToActivate = pended.take(needToActivate);

    for (var entity in entitiesToActivate) {
      entity.status = EntityStatus.active;
      entity.future = _runTask(entity);
    }

    if (entitiesToActivate.isEmpty) {
      return false;
    }

    return true;
  }

  _checkQueue() {
    final isSomethingCleaned = _cleanCompleted();
    final isSomethingRunned = _runPended();

    if (isSomethingCleaned || isSomethingRunned) {
      onUpdate!();
    }
  }

  void add(T entity) {
    _queue.add(
      ActiveQueueEntity(
        data: entity,
      )
    );

    onUpdate!();
    _checkQueue();
  }
}
