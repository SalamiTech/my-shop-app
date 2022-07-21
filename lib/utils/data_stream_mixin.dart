// use this to add a stream broadcast to a class
import 'dart:async';

import 'package:meta/meta.dart';

mixin DataStreamMixin<T> {
  final _streamController = StreamController<T>.broadcast();

  /// access the stream
  Stream<T> get stream => _streamController.stream;

  /// access the sink
  @protected
  Sink<T> get sink => _streamController.sink;

  ///
  T? _lastEvent;

  /// access the last event sent into the stream
  T? get lastEvent => _lastEvent;

  /// adds an event into the stream
  /// also stores is as a [lastEvent]
  /// and notifies state
  @protected
  void addEvent(T event) {
    _lastEvent = event;
    sink.add(event);
  }

  /// clear lastevent
  void clear() {
    _lastEvent = null;
  }

  /// close the stream
  void dispose() {
    _streamController.close();
  }
}
