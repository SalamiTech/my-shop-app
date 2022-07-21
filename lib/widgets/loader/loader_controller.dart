import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/data_stream_mixin.dart';
import 'package:provider/provider.dart';

import 'loader_screen.dart';

class LoaderController extends ChangeNotifier with DataStreamMixin<LoaderData> {
  AnimationController? _controller;

  static LoaderController of(BuildContext context) {
    return Provider.of<LoaderController>(context, listen: false);
  }

  void withController(AnimationController animCtrl) {
    _controller = animCtrl;
  }

  void showLoader({String? message}) {
    _controller?.forward();
    addEvent(LoaderData(state: LoaderState.showing, message: message));
  }

  void hideLoader() {
    _controller?.reverse();
    addEvent(const LoaderData(state: LoaderState.hidden));
  }
}
