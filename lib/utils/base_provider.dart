import 'package:flutter/material.dart';

import 'data_stream_mixin.dart';

enum ProviderState { idle, loading, success, error }

class ProviderEvent<T> {
  final T? data;
  final ProviderState state;
  final String? message;

  const ProviderEvent.idle()
      : state = ProviderState.idle,
        data = null,
        message = null;

  const ProviderEvent.loading({this.data})
      : state = ProviderState.loading,
        message = null;

  const ProviderEvent.success({required this.data})
      : state = ProviderState.success,
        message = null;

  const ProviderEvent.error({required this.message})
      : state = ProviderState.error,
        data = null;
}

abstract class BaseProvider<T> extends ChangeNotifier with DataStreamMixin<ProviderEvent<T>> {
  @override
  void clear() {
    super.clear();
    addEvent(const ProviderEvent.idle());
  }
}
