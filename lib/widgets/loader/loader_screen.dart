import 'package:flutter/material.dart';

import 'loader_controller.dart';
import 'loader_view.dart';

enum LoaderState { showing, hidden }

class LoaderData {
  final LoaderState state;
  final String? message;

  const LoaderData({
    required this.state,
    this.message,
  });
}

class LoadingScreen extends StatefulWidget {
  final LoaderController? loaderCtrl;
  final Color? backgroundColor;

  const LoadingScreen({
    Key? key,
    this.loaderCtrl,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationCtrl;

  @override
  void initState() {
    super.initState();

    animationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loaderCtrl != null) {
      widget.loaderCtrl!.withController(animationCtrl);
      return LoaderView(controller: animationCtrl);
    }

    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      body: LoaderView(controller: animationCtrl, useColor: false),
    );
  }

  @override
  void dispose() {
    animationCtrl.dispose();
    super.dispose();
  }
}

class LoaderWrapper extends StatelessWidget {
  final Widget child;

  const LoaderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loaderCtrl = LoaderController.of(context);

    return StreamBuilder<LoaderData>(
      builder: (_, snap) {
        final data = snap.data;
        final _loading = data?.state == LoaderState.showing;
        return Stack(
          children: [
            child,
            if (_loading) LoadingScreen(loaderCtrl: loaderCtrl),
          ],
        );
      },
      stream: loaderCtrl.stream,
      initialData: loaderCtrl.lastEvent,
    );
  }
}
